; DESCRIPTION: Draws a black circle centered at (416, 128) with radius 21.
; PLAN: r0=416(x), r1=128(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 128
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
