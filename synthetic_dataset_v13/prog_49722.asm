; DESCRIPTION: Draws a white circle centered at (334, 117) with radius 74.
; PLAN: r0=334(x), r1=117(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 117
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
