; DESCRIPTION: Draws a black circle centered at (219, 143) with radius 76.
; PLAN: r0=219(x), r1=143(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 143
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
