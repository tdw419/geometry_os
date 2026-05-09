; DESCRIPTION: Draws a yellow line from (478, 158) to (501, 147).
; PLAN: r0=478(x1), r1=158(y1), r2=501(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 158
LDI r2, 501
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
