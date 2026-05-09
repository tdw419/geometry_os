; DESCRIPTION: Draws a black circle centered at (315, 128) with radius 30.
; PLAN: r0=315(x), r1=128(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 128
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
