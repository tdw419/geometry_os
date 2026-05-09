; DESCRIPTION: Creates a black circular shape at (232, 147) with radius 14.
; PLAN: r0=232(x), r1=147(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 232
LDI r1, 147
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
