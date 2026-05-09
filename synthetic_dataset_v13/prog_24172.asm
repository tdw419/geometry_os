; DESCRIPTION: Renders a blue line between points (55, 158) and (339, 78).
; PLAN: r0=55(x1), r1=158(y1), r2=339(x2), r3=78(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 158
LDI r2, 339
LDI r3, 78
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
