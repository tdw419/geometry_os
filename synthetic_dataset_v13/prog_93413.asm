; DESCRIPTION: Draws a purple line from (93, 252) to (318, 241).
; PLAN: r0=93(x1), r1=252(y1), r2=318(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 252
LDI r2, 318
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
