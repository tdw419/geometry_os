; DESCRIPTION: Draws a yellow circle centered at (254, 172) with radius 41.
; PLAN: r0=254(x), r1=172(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 172
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
