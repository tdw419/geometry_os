; DESCRIPTION: Places a purple line segment connecting (432, 60) to (29, 78).
; PLAN: r0=432(x1), r1=60(y1), r2=29(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 60
LDI r2, 29
LDI r3, 78
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
