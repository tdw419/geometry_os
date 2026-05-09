; DESCRIPTION: Draws a black circle centered at (382, 132) with radius 79.
; PLAN: r0=382(x), r1=132(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 132
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
