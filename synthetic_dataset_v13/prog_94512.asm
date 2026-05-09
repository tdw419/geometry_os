; DESCRIPTION: Draws a black circle centered at (44, 225) with radius 31.
; PLAN: r0=44(x), r1=225(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 225
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
