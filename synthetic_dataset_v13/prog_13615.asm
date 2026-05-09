; DESCRIPTION: Draws a black circle centered at (292, 115) with radius 51.
; PLAN: r0=292(x), r1=115(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 115
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
