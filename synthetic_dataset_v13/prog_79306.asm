; DESCRIPTION: Draws a black circle centered at (252, 159) with radius 52.
; PLAN: r0=252(x), r1=159(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 159
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
