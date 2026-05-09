; DESCRIPTION: Places a purple line segment connecting (155, 68) to (25, 22).
; PLAN: r0=155(x1), r1=68(y1), r2=25(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 68
LDI r2, 25
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
