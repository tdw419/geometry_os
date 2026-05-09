; DESCRIPTION: Draws a black circle centered at (46, 75) with radius 26.
; PLAN: r0=46(x), r1=75(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 75
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
