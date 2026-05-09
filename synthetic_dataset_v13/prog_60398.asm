; DESCRIPTION: Renders a blue line between points (358, 136) and (88, 62).
; PLAN: r0=358(x1), r1=136(y1), r2=88(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 136
LDI r2, 88
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
