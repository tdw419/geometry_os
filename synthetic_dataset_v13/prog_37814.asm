; DESCRIPTION: Draws a black circle centered at (371, 176) with radius 51.
; PLAN: r0=371(x), r1=176(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 176
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
