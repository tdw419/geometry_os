; DESCRIPTION: Renders a purple line between points (160, 49) and (93, 43).
; PLAN: r0=160(x1), r1=49(y1), r2=93(x2), r3=43(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 49
LDI r2, 93
LDI r3, 43
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
