; DESCRIPTION: Renders a blue line between points (200, 118) and (147, 10).
; PLAN: r0=200(x1), r1=118(y1), r2=147(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 118
LDI r2, 147
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
