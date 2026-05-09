; DESCRIPTION: Draws a black circle centered at (134, 66) with radius 42.
; PLAN: r0=134(x), r1=66(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 66
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
