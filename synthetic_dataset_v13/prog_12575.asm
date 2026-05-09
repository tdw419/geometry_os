; DESCRIPTION: Draws a black circle centered at (187, 119) with radius 51.
; PLAN: r0=187(x), r1=119(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 119
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
