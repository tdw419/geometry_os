; DESCRIPTION: Draws a black circle centered at (362, 200) with radius 28.
; PLAN: r0=362(x), r1=200(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 200
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
