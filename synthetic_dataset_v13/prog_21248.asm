; DESCRIPTION: Draws a black circle centered at (476, 184) with radius 27.
; PLAN: r0=476(x), r1=184(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 476
LDI r1, 184
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
