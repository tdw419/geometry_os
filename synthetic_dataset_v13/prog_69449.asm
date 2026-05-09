; DESCRIPTION: Draws a black circle centered at (375, 64) with radius 52.
; PLAN: r0=375(x), r1=64(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 64
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
