; DESCRIPTION: Places a magenta line segment connecting (149, 251) to (257, 117).
; PLAN: r0=149(x1), r1=251(y1), r2=257(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 251
LDI r2, 257
LDI r3, 117
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
