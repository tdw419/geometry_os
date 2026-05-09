; DESCRIPTION: Draws a white circle centered at (263, 41) with radius 12.
; PLAN: r0=263(x), r1=41(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 263
LDI r1, 41
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
