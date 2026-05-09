; DESCRIPTION: Places a purple line segment connecting (476, 88) to (424, 138).
; PLAN: r0=476(x1), r1=88(y1), r2=424(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 88
LDI r2, 424
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
