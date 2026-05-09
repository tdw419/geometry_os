; DESCRIPTION: Creates a black circular shape at (157, 121) with radius 18.
; PLAN: r0=157(x), r1=121(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 121
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
