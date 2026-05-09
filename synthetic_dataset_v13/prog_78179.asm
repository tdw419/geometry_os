; DESCRIPTION: Draws a white circle centered at (268, 76) with radius 56.
; PLAN: r0=268(x), r1=76(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 76
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
