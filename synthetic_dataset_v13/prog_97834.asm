; DESCRIPTION: Places a magenta line segment connecting (414, 159) to (6, 208).
; PLAN: r0=414(x1), r1=159(y1), r2=6(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 159
LDI r2, 6
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
