; DESCRIPTION: Places a orange line segment connecting (50, 246) to (257, 62).
; PLAN: r0=50(x1), r1=246(y1), r2=257(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 246
LDI r2, 257
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
