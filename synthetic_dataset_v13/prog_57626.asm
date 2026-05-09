; DESCRIPTION: Places a magenta line segment connecting (312, 109) to (212, 123).
; PLAN: r0=312(x1), r1=109(y1), r2=212(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 109
LDI r2, 212
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
