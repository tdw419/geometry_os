; DESCRIPTION: Draws a black circle centered at (78, 208) with radius 47.
; PLAN: r0=78(x), r1=208(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 208
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
