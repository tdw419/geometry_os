; DESCRIPTION: Places a orange line segment connecting (257, 220) to (418, 73).
; PLAN: r0=257(x1), r1=220(y1), r2=418(x2), r3=73(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 220
LDI r2, 418
LDI r3, 73
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
