; DESCRIPTION: Renders a blue line between points (84, 94) and (136, 110).
; PLAN: r0=84(x1), r1=94(y1), r2=136(x2), r3=110(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 94
LDI r2, 136
LDI r3, 110
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
