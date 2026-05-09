; DESCRIPTION: Places a blue line segment connecting (369, 99) to (94, 7).
; PLAN: r0=369(x1), r1=99(y1), r2=94(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 99
LDI r2, 94
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
