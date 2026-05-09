; DESCRIPTION: Renders a blue line between points (3, 201) and (482, 136).
; PLAN: r0=3(x1), r1=201(y1), r2=482(x2), r3=136(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 201
LDI r2, 482
LDI r3, 136
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
