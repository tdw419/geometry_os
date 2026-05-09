; DESCRIPTION: Draws a black circle centered at (217, 172) with radius 33.
; PLAN: r0=217(x), r1=172(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 172
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
