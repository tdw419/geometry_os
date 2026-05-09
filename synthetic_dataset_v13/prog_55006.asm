; DESCRIPTION: Renders a blue line between points (260, 232) and (200, 25).
; PLAN: r0=260(x1), r1=232(y1), r2=200(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 232
LDI r2, 200
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
