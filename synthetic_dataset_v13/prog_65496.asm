; DESCRIPTION: Draws a white circle centered at (292, 66) with radius 51.
; PLAN: r0=292(x), r1=66(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 66
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
