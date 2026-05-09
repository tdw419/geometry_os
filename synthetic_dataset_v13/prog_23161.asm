; DESCRIPTION: Renders a purple line between points (76, 232) and (424, 73).
; PLAN: r0=76(x1), r1=232(y1), r2=424(x2), r3=73(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 232
LDI r2, 424
LDI r3, 73
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
