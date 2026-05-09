; DESCRIPTION: Places a orange circle of radius 25 at center (257, 60).
; PLAN: r0=257(x), r1=60(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 257
LDI r1, 60
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
