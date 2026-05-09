; DESCRIPTION: Places a magenta line segment connecting (227, 78) to (357, 232).
; PLAN: r0=227(x1), r1=78(y1), r2=357(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 78
LDI r2, 357
LDI r3, 232
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
