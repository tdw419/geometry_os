; DESCRIPTION: Places a yellow line segment connecting (257, 7) to (408, 191).
; PLAN: r0=257(x1), r1=7(y1), r2=408(x2), r3=191(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 7
LDI r2, 408
LDI r3, 191
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
