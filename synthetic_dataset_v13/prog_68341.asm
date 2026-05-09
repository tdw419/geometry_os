; DESCRIPTION: Draws a cyan circle centered at (246, 176) with radius 41.
; PLAN: r0=246(x), r1=176(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 176
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
