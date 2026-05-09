; DESCRIPTION: Draws a white circle centered at (293, 165) with radius 77.
; PLAN: r0=293(x), r1=165(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 165
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
