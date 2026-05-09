; DESCRIPTION: Draws a black circle centered at (362, 142) with radius 51.
; PLAN: r0=362(x), r1=142(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 142
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
