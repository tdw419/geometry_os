; DESCRIPTION: Places a blue line segment connecting (225, 155) to (369, 4).
; PLAN: r0=225(x1), r1=155(y1), r2=369(x2), r3=4(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 155
LDI r2, 369
LDI r3, 4
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
