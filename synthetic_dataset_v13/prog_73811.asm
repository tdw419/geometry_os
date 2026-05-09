; DESCRIPTION: Renders a blue line between points (163, 84) and (375, 147).
; PLAN: r0=163(x1), r1=84(y1), r2=375(x2), r3=147(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 84
LDI r2, 375
LDI r3, 147
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
