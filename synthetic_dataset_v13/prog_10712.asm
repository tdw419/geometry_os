; DESCRIPTION: Places a magenta line segment connecting (183, 114) to (357, 26).
; PLAN: r0=183(x1), r1=114(y1), r2=357(x2), r3=26(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 114
LDI r2, 357
LDI r3, 26
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
