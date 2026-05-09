; DESCRIPTION: Places a blue line segment connecting (497, 63) to (369, 108).
; PLAN: r0=497(x1), r1=63(y1), r2=369(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 63
LDI r2, 369
LDI r3, 108
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
