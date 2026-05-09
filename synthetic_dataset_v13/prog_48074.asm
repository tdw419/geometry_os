; DESCRIPTION: Draws a green circle centered at (348, 158) with radius 61.
; PLAN: r0=348(x), r1=158(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 348
LDI r1, 158
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
