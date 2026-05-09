; DESCRIPTION: Draws a white circle centered at (248, 57) with radius 41.
; PLAN: r0=248(x), r1=57(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 248
LDI r1, 57
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
