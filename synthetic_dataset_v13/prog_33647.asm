; DESCRIPTION: Draws a black circle centered at (164, 113) with radius 29.
; PLAN: r0=164(x), r1=113(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 113
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
