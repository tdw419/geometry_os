; DESCRIPTION: Places a blue line segment connecting (474, 68) to (369, 6).
; PLAN: r0=474(x1), r1=68(y1), r2=369(x2), r3=6(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 68
LDI r2, 369
LDI r3, 6
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
