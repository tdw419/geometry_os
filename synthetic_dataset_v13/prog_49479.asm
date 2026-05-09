; DESCRIPTION: Draws a purple circle centered at (184, 167) with radius 18.
; PLAN: r0=184(x), r1=167(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 167
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
