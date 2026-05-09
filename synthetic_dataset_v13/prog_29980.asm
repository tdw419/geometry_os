; DESCRIPTION: Places a magenta line segment connecting (56, 232) to (508, 245).
; PLAN: r0=56(x1), r1=232(y1), r2=508(x2), r3=245(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 232
LDI r2, 508
LDI r3, 245
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
