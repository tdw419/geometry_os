; DESCRIPTION: Places a magenta line segment connecting (163, 89) to (116, 34).
; PLAN: r0=163(x1), r1=89(y1), r2=116(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 89
LDI r2, 116
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
