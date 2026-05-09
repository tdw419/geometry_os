; DESCRIPTION: Draws a white circle centered at (167, 81) with radius 71.
; PLAN: r0=167(x), r1=81(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 81
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
