; DESCRIPTION: Creates a black circular shape at (261, 92) with radius 64.
; PLAN: r0=261(x), r1=92(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 92
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
