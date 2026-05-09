; DESCRIPTION: Draws a red circle centered at (134, 144) with radius 41.
; PLAN: r0=134(x), r1=144(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 144
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
