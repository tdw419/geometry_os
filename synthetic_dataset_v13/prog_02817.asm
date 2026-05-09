; DESCRIPTION: Places a purple line segment connecting (136, 218) to (17, 116).
; PLAN: r0=136(x1), r1=218(y1), r2=17(x2), r3=116(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 218
LDI r2, 17
LDI r3, 116
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
