; DESCRIPTION: Draws a purple circle centered at (33, 41) with radius 28.
; PLAN: r0=33(x), r1=41(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 33
LDI r1, 41
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
