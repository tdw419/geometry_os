; DESCRIPTION: Places a yellow line segment connecting (295, 229) to (470, 152).
; PLAN: r0=295(x1), r1=229(y1), r2=470(x2), r3=152(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 229
LDI r2, 470
LDI r3, 152
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
