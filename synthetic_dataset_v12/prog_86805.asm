; DESCRIPTION: Draws a white circle centered at (358, 92) with radius 74.
; PLAN: r0=358(x), r1=92(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 358
LDI r1, 92
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
