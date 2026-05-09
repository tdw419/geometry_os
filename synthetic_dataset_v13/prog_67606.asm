; DESCRIPTION: Draws a black circle centered at (362, 184) with radius 39.
; PLAN: r0=362(x), r1=184(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 184
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
