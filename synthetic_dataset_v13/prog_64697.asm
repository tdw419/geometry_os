; DESCRIPTION: Places a orange circle of radius 62 at center (159, 87).
; PLAN: r0=159(x), r1=87(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 87
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
