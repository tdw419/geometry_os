; DESCRIPTION: Draws a magenta circle centered at (41, 55) with radius 34.
; PLAN: r0=41(x), r1=55(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 55
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
