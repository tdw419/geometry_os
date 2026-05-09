; DESCRIPTION: Draws a black circle centered at (362, 28) with radius 11.
; PLAN: r0=362(x), r1=28(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 28
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
