; DESCRIPTION: Draws a black circle centered at (381, 135) with radius 53.
; PLAN: r0=381(x), r1=135(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 135
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
