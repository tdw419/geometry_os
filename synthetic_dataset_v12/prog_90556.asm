; DESCRIPTION: Renders a purple line between points (97, 74) and (184, 105).
; PLAN: r0=97(x1), r1=74(y1), r2=184(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 74
LDI r2, 184
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
