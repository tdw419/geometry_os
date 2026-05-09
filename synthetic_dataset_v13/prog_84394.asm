; DESCRIPTION: Draws a black circle centered at (329, 123) with radius 72.
; PLAN: r0=329(x), r1=123(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 123
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
