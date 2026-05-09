; DESCRIPTION: Draws a purple line from (501, 211) to (155, 245).
; PLAN: r0=501(x1), r1=211(y1), r2=155(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 211
LDI r2, 155
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
