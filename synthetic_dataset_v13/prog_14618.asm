; DESCRIPTION: Draws a black circle centered at (181, 98) with radius 52.
; PLAN: r0=181(x), r1=98(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 98
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
