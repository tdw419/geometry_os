; DESCRIPTION: Draws a red circle centered at (336, 214) with radius 41.
; PLAN: r0=336(x), r1=214(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 214
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
