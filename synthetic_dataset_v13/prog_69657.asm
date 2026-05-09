; DESCRIPTION: Draws a black circle centered at (255, 176) with radius 17.
; PLAN: r0=255(x), r1=176(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 176
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
