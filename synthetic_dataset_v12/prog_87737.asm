; DESCRIPTION: Places a purple line segment connecting (93, 241) to (306, 147).
; PLAN: r0=93(x1), r1=241(y1), r2=306(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 241
LDI r2, 306
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
