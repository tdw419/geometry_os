; DESCRIPTION: Renders a blue line between points (181, 158) and (93, 39).
; PLAN: r0=181(x1), r1=158(y1), r2=93(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 158
LDI r2, 93
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
