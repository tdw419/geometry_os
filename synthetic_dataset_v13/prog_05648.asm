; DESCRIPTION: Draws a white circle centered at (172, 92) with radius 43.
; PLAN: r0=172(x), r1=92(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 92
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
