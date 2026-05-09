; DESCRIPTION: Draws a white circle centered at (299, 10) with radius 10.
; PLAN: r0=299(x), r1=10(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 10
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
