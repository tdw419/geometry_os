; DESCRIPTION: Draws a black circle centered at (181, 151) with radius 74.
; PLAN: r0=181(x), r1=151(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 151
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
