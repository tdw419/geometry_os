; DESCRIPTION: Draws a black circle centered at (453, 128) with radius 38.
; PLAN: r0=453(x), r1=128(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 453
LDI r1, 128
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
