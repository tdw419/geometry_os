; DESCRIPTION: Draws a white circle centered at (382, 165) with radius 43.
; PLAN: r0=382(x), r1=165(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 165
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
