; DESCRIPTION: Places a purple line segment connecting (402, 200) to (334, 116).
; PLAN: r0=402(x1), r1=200(y1), r2=334(x2), r3=116(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 200
LDI r2, 334
LDI r3, 116
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
