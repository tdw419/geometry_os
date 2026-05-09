; DESCRIPTION: Draws a black circle centered at (94, 184) with radius 53.
; PLAN: r0=94(x), r1=184(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 184
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
