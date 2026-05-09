; DESCRIPTION: Renders a purple line between points (379, 101) and (411, 3).
; PLAN: r0=379(x1), r1=101(y1), r2=411(x2), r3=3(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 101
LDI r2, 411
LDI r3, 3
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
