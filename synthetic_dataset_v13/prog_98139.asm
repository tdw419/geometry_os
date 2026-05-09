; DESCRIPTION: Renders a blue line between points (147, 8) and (232, 155).
; PLAN: r0=147(x1), r1=8(y1), r2=232(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 8
LDI r2, 232
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
