; DESCRIPTION: Places a orange line segment connecting (188, 110) to (55, 238).
; PLAN: r0=188(x1), r1=110(y1), r2=55(x2), r3=238(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 110
LDI r2, 55
LDI r3, 238
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
