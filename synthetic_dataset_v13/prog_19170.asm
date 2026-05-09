; DESCRIPTION: Draws a black circle centered at (274, 151) with radius 48.
; PLAN: r0=274(x), r1=151(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 151
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
