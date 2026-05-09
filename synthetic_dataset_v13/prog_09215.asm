; DESCRIPTION: Draws a white circle centered at (356, 138) with radius 41.
; PLAN: r0=356(x), r1=138(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 356
LDI r1, 138
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
