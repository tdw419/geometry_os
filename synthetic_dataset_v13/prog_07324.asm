; DESCRIPTION: Places a purple line segment connecting (88, 245) to (163, 106).
; PLAN: r0=88(x1), r1=245(y1), r2=163(x2), r3=106(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 245
LDI r2, 163
LDI r3, 106
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
