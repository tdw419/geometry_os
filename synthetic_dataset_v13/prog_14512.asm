; DESCRIPTION: Draws a white circle centered at (421, 166) with radius 77.
; PLAN: r0=421(x), r1=166(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 166
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
