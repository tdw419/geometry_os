; DESCRIPTION: Places a green line segment connecting (495, 167) to (257, 172).
; PLAN: r0=495(x1), r1=167(y1), r2=257(x2), r3=172(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 167
LDI r2, 257
LDI r3, 172
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
