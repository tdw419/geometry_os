; DESCRIPTION: Draws a red circle centered at (137, 186) with radius 41.
; PLAN: r0=137(x), r1=186(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 186
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
