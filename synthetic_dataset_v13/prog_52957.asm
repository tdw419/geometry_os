; DESCRIPTION: Draws a black circle centered at (442, 183) with radius 59.
; PLAN: r0=442(x), r1=183(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 442
LDI r1, 183
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
