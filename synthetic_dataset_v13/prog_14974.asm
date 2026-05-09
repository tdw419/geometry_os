; DESCRIPTION: Places a magenta line segment connecting (369, 40) to (318, 115).
; PLAN: r0=369(x1), r1=40(y1), r2=318(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 40
LDI r2, 318
LDI r3, 115
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
