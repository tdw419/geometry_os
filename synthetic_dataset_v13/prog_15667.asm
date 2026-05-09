; DESCRIPTION: Places a green line segment connecting (188, 117) to (86, 34).
; PLAN: r0=188(x1), r1=117(y1), r2=86(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 117
LDI r2, 86
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
