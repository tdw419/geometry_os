; DESCRIPTION: Draws a white circle centered at (183, 45) with radius 39.
; PLAN: r0=183(x), r1=45(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 45
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
