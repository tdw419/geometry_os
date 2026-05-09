; DESCRIPTION: Renders a blue line between points (39, 35) and (163, 136).
; PLAN: r0=39(x1), r1=35(y1), r2=163(x2), r3=136(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 35
LDI r2, 163
LDI r3, 136
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
