; DESCRIPTION: Draws a black circle centered at (274, 160) with radius 73.
; PLAN: r0=274(x), r1=160(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 160
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
