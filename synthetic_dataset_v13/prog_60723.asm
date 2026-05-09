; DESCRIPTION: Renders a purple line between points (76, 237) and (118, 35).
; PLAN: r0=76(x1), r1=237(y1), r2=118(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 237
LDI r2, 118
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
