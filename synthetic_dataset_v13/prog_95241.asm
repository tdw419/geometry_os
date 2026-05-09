; DESCRIPTION: Draws a blue circle centered at (43, 81) with radius 41.
; PLAN: r0=43(x), r1=81(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 43
LDI r1, 81
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
