; DESCRIPTION: Places a purple line segment connecting (84, 158) to (247, 78).
; PLAN: r0=84(x1), r1=158(y1), r2=247(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 158
LDI r2, 247
LDI r3, 78
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
