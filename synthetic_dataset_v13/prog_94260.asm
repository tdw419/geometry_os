; DESCRIPTION: Draws a black circle centered at (257, 133) with radius 64.
; PLAN: r0=257(x), r1=133(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 257
LDI r1, 133
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
