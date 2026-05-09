; DESCRIPTION: Draws a white circle centered at (316, 137) with radius 13.
; PLAN: r0=316(x), r1=137(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 137
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
