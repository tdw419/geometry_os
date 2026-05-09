; DESCRIPTION: Draws a white circle centered at (376, 76) with radius 57.
; PLAN: r0=376(x), r1=76(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 76
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
