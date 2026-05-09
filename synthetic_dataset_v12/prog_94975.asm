; DESCRIPTION: Renders a purple line between points (336, 148) and (133, 73).
; PLAN: r0=336(x1), r1=148(y1), r2=133(x2), r3=73(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 148
LDI r2, 133
LDI r3, 73
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
