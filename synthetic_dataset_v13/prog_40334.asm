; DESCRIPTION: Places a magenta line segment connecting (72, 123) to (377, 61).
; PLAN: r0=72(x1), r1=123(y1), r2=377(x2), r3=61(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 123
LDI r2, 377
LDI r3, 61
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
