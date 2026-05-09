; DESCRIPTION: Places a magenta line segment connecting (477, 58) to (369, 63).
; PLAN: r0=477(x1), r1=58(y1), r2=369(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 58
LDI r2, 369
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
