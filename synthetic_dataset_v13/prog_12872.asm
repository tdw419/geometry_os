; DESCRIPTION: Draws a white circle centered at (334, 199) with radius 15.
; PLAN: r0=334(x), r1=199(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 199
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
