; DESCRIPTION: Draws a white circle centered at (310, 96) with radius 47.
; PLAN: r0=310(x), r1=96(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 310
LDI r1, 96
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
