; DESCRIPTION: Draws a black circle centered at (156, 178) with radius 35.
; PLAN: r0=156(x), r1=178(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 178
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
