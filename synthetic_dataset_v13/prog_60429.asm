; DESCRIPTION: Draws a purple line from (390, 17) to (483, 130).
; PLAN: r0=390(x1), r1=17(y1), r2=483(x2), r3=130(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 17
LDI r2, 483
LDI r3, 130
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
