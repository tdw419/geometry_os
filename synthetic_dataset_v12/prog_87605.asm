; DESCRIPTION: Creates a black circular shape at (248, 224) with radius 11.
; PLAN: r0=248(x), r1=224(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 248
LDI r1, 224
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
