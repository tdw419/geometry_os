; DESCRIPTION: Draws a black circle centered at (397, 208) with radius 32.
; PLAN: r0=397(x), r1=208(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 208
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
