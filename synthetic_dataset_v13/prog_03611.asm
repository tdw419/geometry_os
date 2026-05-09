; DESCRIPTION: Places a purple line segment connecting (366, 49) to (424, 181).
; PLAN: r0=366(x1), r1=49(y1), r2=424(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 49
LDI r2, 424
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
