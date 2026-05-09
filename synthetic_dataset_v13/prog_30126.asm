; DESCRIPTION: Draws a red circle centered at (205, 41) with radius 12.
; PLAN: r0=205(x), r1=41(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 41
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
