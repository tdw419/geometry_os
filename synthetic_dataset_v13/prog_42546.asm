; DESCRIPTION: Places a magenta line segment connecting (181, 183) to (324, 56).
; PLAN: r0=181(x1), r1=183(y1), r2=324(x2), r3=56(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 183
LDI r2, 324
LDI r3, 56
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
