; DESCRIPTION: Places a magenta line segment connecting (257, 117) to (447, 105).
; PLAN: r0=257(x1), r1=117(y1), r2=447(x2), r3=105(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 117
LDI r2, 447
LDI r3, 105
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
