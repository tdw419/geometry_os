; DESCRIPTION: Renders a blue line between points (142, 136) and (435, 122).
; PLAN: r0=142(x1), r1=136(y1), r2=435(x2), r3=122(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 136
LDI r2, 435
LDI r3, 122
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
