; DESCRIPTION: Draws a magenta circle centered at (118, 122) with radius 41.
; PLAN: r0=118(x), r1=122(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 122
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
