; DESCRIPTION: Renders a purple line between points (451, 158) and (442, 116).
; PLAN: r0=451(x1), r1=158(y1), r2=442(x2), r3=116(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 158
LDI r2, 442
LDI r3, 116
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
