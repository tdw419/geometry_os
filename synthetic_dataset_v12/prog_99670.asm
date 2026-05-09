; DESCRIPTION: Draws a black circle centered at (111, 150) with radius 37.
; PLAN: r0=111(x), r1=150(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 150
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
