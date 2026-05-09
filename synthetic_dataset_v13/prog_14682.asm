; DESCRIPTION: Draws a white circle centered at (165, 211) with radius 35.
; PLAN: r0=165(x), r1=211(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 211
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
