; DESCRIPTION: Renders a purple line between points (93, 199) and (312, 122).
; PLAN: r0=93(x1), r1=199(y1), r2=312(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 199
LDI r2, 312
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
