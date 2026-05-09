; DESCRIPTION: Draws a black circle centered at (223, 144) with radius 60.
; PLAN: r0=223(x), r1=144(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 144
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
