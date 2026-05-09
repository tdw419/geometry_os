; DESCRIPTION: Places a magenta line segment connecting (250, 15) to (118, 116).
; PLAN: r0=250(x1), r1=15(y1), r2=118(x2), r3=116(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 15
LDI r2, 118
LDI r3, 116
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
