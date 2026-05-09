; DESCRIPTION: Places a blue line segment connecting (446, 238) to (369, 106).
; PLAN: r0=446(x1), r1=238(y1), r2=369(x2), r3=106(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 238
LDI r2, 369
LDI r3, 106
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
