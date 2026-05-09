; DESCRIPTION: Places a orange line segment connecting (390, 163) to (133, 13).
; PLAN: r0=390(x1), r1=163(y1), r2=133(x2), r3=13(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 163
LDI r2, 133
LDI r3, 13
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
