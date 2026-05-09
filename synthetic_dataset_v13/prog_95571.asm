; DESCRIPTION: Draws a purple circle centered at (385, 96) with radius 41.
; PLAN: r0=385(x), r1=96(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 96
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
