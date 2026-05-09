; DESCRIPTION: Renders a purple line between points (314, 15) and (318, 211).
; PLAN: r0=314(x1), r1=15(y1), r2=318(x2), r3=211(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 15
LDI r2, 318
LDI r3, 211
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
