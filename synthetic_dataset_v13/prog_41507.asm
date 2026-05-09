; DESCRIPTION: Places a magenta line segment connecting (379, 138) to (14, 10).
; PLAN: r0=379(x1), r1=138(y1), r2=14(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 138
LDI r2, 14
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
