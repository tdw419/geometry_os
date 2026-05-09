; DESCRIPTION: Renders a blue line between points (231, 88) and (478, 100).
; PLAN: r0=231(x1), r1=88(y1), r2=478(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 88
LDI r2, 478
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
