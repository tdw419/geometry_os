; DESCRIPTION: Renders a purple line between points (478, 25) and (22, 31).
; PLAN: r0=478(x1), r1=25(y1), r2=22(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 25
LDI r2, 22
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
