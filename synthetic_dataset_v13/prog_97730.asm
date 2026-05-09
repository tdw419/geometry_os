; DESCRIPTION: Renders a blue line between points (33, 119) and (476, 20).
; PLAN: r0=33(x1), r1=119(y1), r2=476(x2), r3=20(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 119
LDI r2, 476
LDI r3, 20
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
