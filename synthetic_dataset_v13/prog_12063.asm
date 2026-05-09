; DESCRIPTION: Draws a white circle centered at (111, 203) with radius 36.
; PLAN: r0=111(x), r1=203(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 203
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
