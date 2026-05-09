; DESCRIPTION: Places a green line segment connecting (243, 218) to (220, 229).
; PLAN: r0=243(x1), r1=218(y1), r2=220(x2), r3=229(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 218
LDI r2, 220
LDI r3, 229
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
