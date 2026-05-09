; DESCRIPTION: Draws a black circle centered at (65, 159) with radius 40.
; PLAN: r0=65(x), r1=159(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 159
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
