; DESCRIPTION: Places a purple line segment connecting (78, 165) to (418, 147).
; PLAN: r0=78(x1), r1=165(y1), r2=418(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 165
LDI r2, 418
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
