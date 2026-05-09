; DESCRIPTION: Renders a purple line between points (119, 4) and (432, 52).
; PLAN: r0=119(x1), r1=4(y1), r2=432(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 4
LDI r2, 432
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
