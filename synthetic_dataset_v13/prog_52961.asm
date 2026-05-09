; DESCRIPTION: Draws a black circle centered at (296, 66) with radius 64.
; PLAN: r0=296(x), r1=66(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 66
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
