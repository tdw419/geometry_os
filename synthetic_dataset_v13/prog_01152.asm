; DESCRIPTION: Draws a red circle centered at (348, 91) with radius 48.
; PLAN: r0=348(x), r1=91(y), r2=48(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 348
LDI r1, 91
LDI r2, 48
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
