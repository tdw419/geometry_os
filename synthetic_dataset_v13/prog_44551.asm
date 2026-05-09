; DESCRIPTION: Renders a blue line between points (62, 232) and (270, 183).
; PLAN: r0=62(x1), r1=232(y1), r2=270(x2), r3=183(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 232
LDI r2, 270
LDI r3, 183
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
