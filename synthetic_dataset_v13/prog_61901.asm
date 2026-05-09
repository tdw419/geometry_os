; DESCRIPTION: Draws a white circle centered at (100, 62) with radius 61.
; PLAN: r0=100(x), r1=62(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 62
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
