; DESCRIPTION: Draws a cyan circle centered at (200, 165) with radius 41.
; PLAN: r0=200(x), r1=165(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 165
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
