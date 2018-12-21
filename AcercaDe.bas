﻿B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Activity
Version=7.8
@EndOfDesignText@
' Proyecto desarrollado por Javier Prieto Martínez como parte del TFG del Curso de Adaptación al Grado de Informática de la Universidad Internacional de la Rioja
' Este código fuente se ofrece con una licencia Creative Commons de tipo Reconocimiento-NoComercial-CompartirIgual 3.0 España (CC BY-NC-SA 3.0 ES)

#Region  Activity Attributes 
	#FullScreen: True
	#IncludeTitle: False
#End Region

Sub Process_Globals
End Sub

Sub Globals
	Private Volver As Button
	Private Logotipo As ImageView
	Private Pictogramas As ImageView
	Private Pictorario As Label
	Private Programador As ImageView
	Private TextoArasaac As WebView
	Private TextoAutor As WebView
	Private ParaTeo As Label
	Private VersionApp As Label
	Private ReinciarConfiguracion As Button
	Private VerVideo As Button
End Sub

Sub Activity_Create(FirstTime As Boolean)
	Activity.LoadLayout("AcercaDe")
	
	TextoAutor.LoadHtml("<html><body><center>"& _
	"<strong>Aplicación</strong>: Javier Prieto Martínez (www.ganso.org)<br />"& _
	"<strong>Licencia</strong>: CC (BY-NC-SA)<br />"& _
	"</center></body></html>")

	TextoArasaac.LoadHtml("<html><body><center>"& _
	"<strong>Pictogramas</strong>: Sergio Palao<br />"& _
	"<strong>Procedencia</strong>: ARASAAC (www.arasaac.org)<br />"& _
	"<strong>Licencia</strong>: CC (BY-NC-SA)<br />"& _
	"<strong>Propiedad</strong>: Gobierno de Aragón<br />"& _
	"</center></body></html>")
	
	ParaTeo.Typeface=Typeface.LoadFromAssets("GreatVibes-Regular.ttf")
	
	VersionApp.Text=Application.VersionName
	
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub


Sub Volver_Click
	Activity.Finish
End Sub

Sub Programador_Click
	Dim p As PhoneIntents
	StartActivity(p.OpenBrowser("http://www.ganso.org"))
End Sub

Sub Pictogramas_Click
	Dim p As PhoneIntents
	StartActivity(p.OpenBrowser("http://www.arasaac.org"))
End Sub

Sub Logotipo_Click
	Dim p As PhoneIntents
	StartActivity(p.OpenBrowser("http://blog.ganso.org/proyectos/pictorario"))
End Sub

Sub VerVideo_Click
	Dim p As PhoneIntents
	'StartActivity(p.OpenBrowser("https://www.youtube.com/watch?v=cjTAGguz5H0"))
	StartActivity(p.OpenBrowser("http://Bit.ly/VideoPictorario"))
End Sub

Sub ReinciarConfiguracion_Click
	If Msgbox2("Se borrarán todas las secuencias creadas y se dejará solo la de ejemplo."&CRLF&CRLF& _
		"¿Está seguro de que desea hacer esto?","Borrar todas las secuencias","Sí","","No",Null)==DialogResponse.POSITIVE Then
		CallSub(Starter,"Inicializar_Con_Ejemplo")
		CallSub(Starter,"BorrarPictogramas")
		CallSub(Starter,"Guardar_Configuracion")
		Activity.Finish
	End If
End Sub

Sub VersionApp_Click
	Msgbox2("Novedades de la versión:"&CRLF&CRLF&Starter.CambiosVersion,"Versión "&Application.VersionName,"Continuar","","",Null)
End Sub

Sub Activity_KeyPress (KeyCode As Int) 
	If KeyCode = KeyCodes.KEYCODE_BACK Then 'Al pulsar atrás...
		Sleep(0) 'No hace nada
	End If
End Sub