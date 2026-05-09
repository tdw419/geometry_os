; DESCRIPTION: Draws a white circle centered at (335, 203) with radius 17.
; PLAN: r0=335(x), r1=203(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 203
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
