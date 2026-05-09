; DESCRIPTION: Draws a black circle centered at (217, 148) with radius 70.
; PLAN: r0=217(x), r1=148(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 148
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
