; DESCRIPTION: Draws a purple circle centered at (208, 189) with radius 41.
; PLAN: r0=208(x), r1=189(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 189
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
