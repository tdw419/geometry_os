; DESCRIPTION: Draws a green circle centered at (117, 94) with radius 41.
; PLAN: r0=117(x), r1=94(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 94
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
