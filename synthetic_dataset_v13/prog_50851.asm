; DESCRIPTION: Places a green line segment connecting (295, 119) to (218, 221).
; PLAN: r0=295(x1), r1=119(y1), r2=218(x2), r3=221(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 119
LDI r2, 218
LDI r3, 221
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
