; DESCRIPTION: Renders a blue line between points (435, 147) and (431, 2).
; PLAN: r0=435(x1), r1=147(y1), r2=431(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 147
LDI r2, 431
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
