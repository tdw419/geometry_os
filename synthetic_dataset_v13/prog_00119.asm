; DESCRIPTION: Places a magenta line segment connecting (432, 181) to (212, 245).
; PLAN: r0=432(x1), r1=181(y1), r2=212(x2), r3=245(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 181
LDI r2, 212
LDI r3, 245
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
