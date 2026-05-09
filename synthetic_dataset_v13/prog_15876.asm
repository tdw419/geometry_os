; DESCRIPTION: Places a magenta line segment connecting (407, 34) to (379, 168).
; PLAN: r0=407(x1), r1=34(y1), r2=379(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 34
LDI r2, 379
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
