; DESCRIPTION: Places a magenta line segment connecting (369, 227) to (347, 226).
; PLAN: r0=369(x1), r1=227(y1), r2=347(x2), r3=226(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 227
LDI r2, 347
LDI r3, 226
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
