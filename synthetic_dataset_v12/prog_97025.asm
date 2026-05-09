; DESCRIPTION: Draws a black circle centered at (257, 124) with radius 46.
; PLAN: r0=257(x), r1=124(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 257
LDI r1, 124
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
