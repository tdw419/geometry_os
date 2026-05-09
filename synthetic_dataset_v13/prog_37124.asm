; DESCRIPTION: Creates a black circular shape at (276, 69) with radius 62.
; PLAN: r0=276(x), r1=69(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 69
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
