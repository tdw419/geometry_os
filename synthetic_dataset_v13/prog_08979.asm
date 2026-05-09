; DESCRIPTION: Draws a green circle centered at (467, 159) with radius 41.
; PLAN: r0=467(x), r1=159(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 467
LDI r1, 159
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
