; DESCRIPTION: Draws a black circle centered at (268, 94) with radius 31.
; PLAN: r0=268(x), r1=94(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 94
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
