; DESCRIPTION: Creates a black circular shape at (134, 63) with radius 50.
; PLAN: r0=134(x), r1=63(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 63
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
