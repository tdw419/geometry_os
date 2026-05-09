; DESCRIPTION: Creates a black circular shape at (347, 109) with radius 60.
; PLAN: r0=347(x), r1=109(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 109
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
