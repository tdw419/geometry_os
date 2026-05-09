; DESCRIPTION: Places a orange line segment connecting (374, 173) to (257, 194).
; PLAN: r0=374(x1), r1=173(y1), r2=257(x2), r3=194(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 173
LDI r2, 257
LDI r3, 194
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
