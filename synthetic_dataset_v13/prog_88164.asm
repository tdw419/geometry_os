; DESCRIPTION: Draws a black circle centered at (207, 192) with radius 12.
; PLAN: r0=207(x), r1=192(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 192
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
