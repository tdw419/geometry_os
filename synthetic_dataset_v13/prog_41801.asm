; DESCRIPTION: Creates a black circular shape at (245, 153) with radius 76.
; PLAN: r0=245(x), r1=153(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 153
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
