; DESCRIPTION: Renders a blue line between points (191, 78) and (163, 232).
; PLAN: r0=191(x1), r1=78(y1), r2=163(x2), r3=232(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 78
LDI r2, 163
LDI r3, 232
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
