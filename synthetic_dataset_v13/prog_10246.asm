; DESCRIPTION: Places a purple line segment connecting (335, 22) to (318, 155).
; PLAN: r0=335(x1), r1=22(y1), r2=318(x2), r3=155(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 22
LDI r2, 318
LDI r3, 155
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
