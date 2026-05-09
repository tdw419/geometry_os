; DESCRIPTION: Draws a black circle centered at (270, 184) with radius 50.
; PLAN: r0=270(x), r1=184(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 184
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
