; DESCRIPTION: Draws a black circle centered at (362, 179) with radius 20.
; PLAN: r0=362(x), r1=179(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 179
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
