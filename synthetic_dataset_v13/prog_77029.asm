; DESCRIPTION: Renders a blue line between points (302, 251) and (0, 155).
; PLAN: r0=302(x1), r1=251(y1), r2=0(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 251
LDI r2, 0
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
