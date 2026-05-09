; DESCRIPTION: Places a purple line segment connecting (147, 23) to (318, 10).
; PLAN: r0=147(x1), r1=23(y1), r2=318(x2), r3=10(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 23
LDI r2, 318
LDI r3, 10
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
