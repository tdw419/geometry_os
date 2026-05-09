; DESCRIPTION: Places a magenta line segment connecting (88, 102) to (30, 234).
; PLAN: r0=88(x1), r1=102(y1), r2=30(x2), r3=234(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 102
LDI r2, 30
LDI r3, 234
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
