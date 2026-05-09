; DESCRIPTION: Places a magenta line segment connecting (116, 56) to (98, 158).
; PLAN: r0=116(x1), r1=56(y1), r2=98(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 56
LDI r2, 98
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
