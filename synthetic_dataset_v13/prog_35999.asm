; DESCRIPTION: Draws a black circle centered at (431, 81) with radius 38.
; PLAN: r0=431(x), r1=81(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 81
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
