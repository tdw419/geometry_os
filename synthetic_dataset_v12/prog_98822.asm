; DESCRIPTION: Places a magenta line segment connecting (357, 229) to (167, 17).
; PLAN: r0=357(x1), r1=229(y1), r2=167(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 229
LDI r2, 167
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
