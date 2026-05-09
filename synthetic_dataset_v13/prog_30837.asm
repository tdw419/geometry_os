; DESCRIPTION: Draws a red circle centered at (189, 59) with radius 41.
; PLAN: r0=189(x), r1=59(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 59
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
