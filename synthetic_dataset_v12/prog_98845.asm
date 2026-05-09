; DESCRIPTION: Renders a purple line between points (237, 136) and (472, 104).
; PLAN: r0=237(x1), r1=136(y1), r2=472(x2), r3=104(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 136
LDI r2, 472
LDI r3, 104
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
