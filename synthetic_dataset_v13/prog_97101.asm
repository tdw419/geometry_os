; DESCRIPTION: Places a orange line segment connecting (2, 91) to (163, 233).
; PLAN: r0=2(x1), r1=91(y1), r2=163(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 91
LDI r2, 163
LDI r3, 233
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
