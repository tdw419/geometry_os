; DESCRIPTION: Draws a black circle centered at (353, 75) with radius 68.
; PLAN: r0=353(x), r1=75(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 75
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
