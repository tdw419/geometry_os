; DESCRIPTION: Draws a white circle centered at (318, 113) with radius 33.
; PLAN: r0=318(x), r1=113(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 113
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
