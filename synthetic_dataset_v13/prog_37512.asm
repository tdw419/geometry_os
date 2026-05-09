; DESCRIPTION: Draws a black circle centered at (299, 143) with radius 32.
; PLAN: r0=299(x), r1=143(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 143
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
