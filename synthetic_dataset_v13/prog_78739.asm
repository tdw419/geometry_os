; DESCRIPTION: Renders a blue line between points (141, 157) and (155, 62).
; PLAN: r0=141(x1), r1=157(y1), r2=155(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 157
LDI r2, 155
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
