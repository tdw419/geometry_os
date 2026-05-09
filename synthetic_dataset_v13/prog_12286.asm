; DESCRIPTION: Creates a black circular shape at (378, 155) with radius 69.
; PLAN: r0=378(x), r1=155(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 155
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
