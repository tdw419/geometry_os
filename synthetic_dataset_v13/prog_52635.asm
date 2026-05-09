; DESCRIPTION: Draws a white circle centered at (285, 92) with radius 57.
; PLAN: r0=285(x), r1=92(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 92
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
