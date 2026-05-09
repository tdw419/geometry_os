; DESCRIPTION: Draws a blue circle centered at (257, 53) with radius 12.
; PLAN: r0=257(x), r1=53(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 257
LDI r1, 53
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
