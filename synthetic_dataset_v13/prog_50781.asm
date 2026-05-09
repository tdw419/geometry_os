; DESCRIPTION: Places a magenta line segment connecting (414, 181) to (272, 12).
; PLAN: r0=414(x1), r1=181(y1), r2=272(x2), r3=12(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 181
LDI r2, 272
LDI r3, 12
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
