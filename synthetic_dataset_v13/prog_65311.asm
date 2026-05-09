; DESCRIPTION: Draws a black circle centered at (373, 142) with radius 34.
; PLAN: r0=373(x), r1=142(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 142
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
