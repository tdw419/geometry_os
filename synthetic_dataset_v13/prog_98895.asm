; DESCRIPTION: Creates a black circular shape at (358, 135) with radius 76.
; PLAN: r0=358(x), r1=135(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 358
LDI r1, 135
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
