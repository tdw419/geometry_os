; DESCRIPTION: Draws a green circle centered at (51, 122) with radius 15.
; PLAN: r0=51(x), r1=122(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 122
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
