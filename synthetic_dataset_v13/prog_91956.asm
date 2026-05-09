; DESCRIPTION: Creates a black circular shape at (405, 165) with radius 76.
; PLAN: r0=405(x), r1=165(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 165
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
