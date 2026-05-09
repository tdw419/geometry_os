; DESCRIPTION: Draws a red circle centered at (297, 113) with radius 41.
; PLAN: r0=297(x), r1=113(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 297
LDI r1, 113
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
