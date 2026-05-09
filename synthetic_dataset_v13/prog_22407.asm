; DESCRIPTION: Creates a black circular shape at (296, 114) with radius 43.
; PLAN: r0=296(x), r1=114(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 114
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
