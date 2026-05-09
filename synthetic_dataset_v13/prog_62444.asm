; DESCRIPTION: Draws a black circle centered at (217, 117) with radius 35.
; PLAN: r0=217(x), r1=117(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 117
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
