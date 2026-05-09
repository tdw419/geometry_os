; DESCRIPTION: Places a black line segment connecting (476, 123) to (196, 116).
; PLAN: r0=476(x1), r1=123(y1), r2=196(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 123
LDI r2, 196
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
