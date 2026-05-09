; DESCRIPTION: Creates a black circular shape at (248, 142) with radius 30.
; PLAN: r0=248(x), r1=142(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 248
LDI r1, 142
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
