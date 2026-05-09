; DESCRIPTION: Draws a white circle centered at (265, 105) with radius 51.
; PLAN: r0=265(x), r1=105(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 105
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
