; DESCRIPTION: Draws a black circle centered at (205, 159) with radius 25.
; PLAN: r0=205(x), r1=159(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 159
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
