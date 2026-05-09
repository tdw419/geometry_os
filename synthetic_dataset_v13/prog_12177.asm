; DESCRIPTION: Draws a red circle centered at (41, 112) with radius 39.
; PLAN: r0=41(x), r1=112(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 112
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
