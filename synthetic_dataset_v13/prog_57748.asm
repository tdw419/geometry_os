; DESCRIPTION: Places a magenta line segment connecting (156, 74) to (357, 237).
; PLAN: r0=156(x1), r1=74(y1), r2=357(x2), r3=237(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 74
LDI r2, 357
LDI r3, 237
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
