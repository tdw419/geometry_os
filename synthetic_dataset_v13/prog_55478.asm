; DESCRIPTION: Draws a black circle centered at (31, 143) with radius 29.
; PLAN: r0=31(x), r1=143(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 31
LDI r1, 143
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
