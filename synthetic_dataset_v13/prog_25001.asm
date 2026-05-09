; DESCRIPTION: Creates a black circular shape at (458, 35) with radius 13.
; PLAN: r0=458(x), r1=35(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 458
LDI r1, 35
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
