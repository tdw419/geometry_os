; DESCRIPTION: Draws a white circle centered at (286, 174) with radius 11.
; PLAN: r0=286(x), r1=174(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 174
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
