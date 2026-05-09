; DESCRIPTION: Creates a black circular shape at (76, 121) with radius 48.
; PLAN: r0=76(x), r1=121(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 121
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
