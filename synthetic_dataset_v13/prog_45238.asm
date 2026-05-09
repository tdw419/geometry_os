; DESCRIPTION: Draws a black circle centered at (164, 170) with radius 72.
; PLAN: r0=164(x), r1=170(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 170
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
