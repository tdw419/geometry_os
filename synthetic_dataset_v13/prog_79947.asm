; DESCRIPTION: Places a orange line segment connecting (73, 14) to (257, 143).
; PLAN: r0=73(x1), r1=14(y1), r2=257(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 14
LDI r2, 257
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
