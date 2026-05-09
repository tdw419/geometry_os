; DESCRIPTION: Creates a black circular shape at (159, 56) with radius 52.
; PLAN: r0=159(x), r1=56(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 56
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
