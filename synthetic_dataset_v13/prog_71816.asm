; DESCRIPTION: Draws a red circle centered at (257, 14) with radius 14.
; PLAN: r0=257(x), r1=14(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 257
LDI r1, 14
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
