; DESCRIPTION: Creates a black circular shape at (131, 164) with radius 33.
; PLAN: r0=131(x), r1=164(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 164
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
