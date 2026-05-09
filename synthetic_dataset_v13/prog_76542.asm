; DESCRIPTION: Draws a green circle centered at (348, 58) with radius 12.
; PLAN: r0=348(x), r1=58(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 348
LDI r1, 58
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
