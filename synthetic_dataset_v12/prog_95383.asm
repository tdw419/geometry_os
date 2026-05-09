; DESCRIPTION: Draws a black circle centered at (310, 195) with radius 42.
; PLAN: r0=310(x), r1=195(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 310
LDI r1, 195
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
