; DESCRIPTION: Draws a black circle centered at (399, 69) with radius 28.
; PLAN: r0=399(x), r1=69(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 69
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
