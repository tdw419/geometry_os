; DESCRIPTION: Creates a black circular shape at (244, 104) with radius 69.
; PLAN: r0=244(x), r1=104(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 104
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
