; DESCRIPTION: Draws a black circle centered at (61, 132) with radius 14.
; PLAN: r0=61(x), r1=132(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 132
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
