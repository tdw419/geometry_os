; DESCRIPTION: Draws a white circle centered at (238, 136) with radius 77.
; PLAN: r0=238(x), r1=136(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 136
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
