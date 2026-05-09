; DESCRIPTION: Draws a black circle centered at (254, 53) with radius 34.
; PLAN: r0=254(x), r1=53(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 53
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
