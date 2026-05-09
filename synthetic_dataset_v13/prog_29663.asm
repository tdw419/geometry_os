; DESCRIPTION: Places a magenta line segment connecting (375, 100) to (102, 61).
; PLAN: r0=375(x1), r1=100(y1), r2=102(x2), r3=61(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 100
LDI r2, 102
LDI r3, 61
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
