; DESCRIPTION: Draws a black circle centered at (255, 103) with radius 35.
; PLAN: r0=255(x), r1=103(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 103
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
