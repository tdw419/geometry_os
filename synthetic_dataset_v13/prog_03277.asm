; DESCRIPTION: Renders a blue line between points (118, 188) and (62, 119).
; PLAN: r0=118(x1), r1=188(y1), r2=62(x2), r3=119(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 188
LDI r2, 62
LDI r3, 119
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
