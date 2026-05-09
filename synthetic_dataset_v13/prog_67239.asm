; DESCRIPTION: Draws a black circle centered at (64, 105) with radius 46.
; PLAN: r0=64(x), r1=105(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 105
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
