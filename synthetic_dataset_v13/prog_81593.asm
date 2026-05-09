; DESCRIPTION: Creates a black circular shape at (259, 164) with radius 74.
; PLAN: r0=259(x), r1=164(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 164
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
