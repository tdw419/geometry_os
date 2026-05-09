; DESCRIPTION: Places a magenta line segment connecting (15, 191) to (376, 8).
; PLAN: r0=15(x1), r1=191(y1), r2=376(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 191
LDI r2, 376
LDI r3, 8
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
