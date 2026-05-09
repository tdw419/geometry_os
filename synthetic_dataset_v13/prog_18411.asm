; DESCRIPTION: Draws a black circle centered at (284, 113) with radius 43.
; PLAN: r0=284(x), r1=113(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 284
LDI r1, 113
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
