; DESCRIPTION: Places a purple line segment connecting (318, 232) to (496, 180).
; PLAN: r0=318(x1), r1=232(y1), r2=496(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 232
LDI r2, 496
LDI r3, 180
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
