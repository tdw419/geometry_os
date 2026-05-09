; DESCRIPTION: Places a purple line segment connecting (142, 24) to (339, 181).
; PLAN: r0=142(x1), r1=24(y1), r2=339(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 24
LDI r2, 339
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
