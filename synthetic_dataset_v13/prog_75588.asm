; DESCRIPTION: Renders a purple line between points (341, 101) and (300, 41).
; PLAN: r0=341(x1), r1=101(y1), r2=300(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 101
LDI r2, 300
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
