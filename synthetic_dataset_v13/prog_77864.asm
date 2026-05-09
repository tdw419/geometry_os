; DESCRIPTION: Places a orange circle of radius 37 at center (293, 176).
; PLAN: r0=293(x), r1=176(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 176
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
