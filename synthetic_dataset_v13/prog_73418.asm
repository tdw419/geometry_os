; DESCRIPTION: Draws a black circle centered at (402, 197) with radius 38.
; PLAN: r0=402(x), r1=197(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 197
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
