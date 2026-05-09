; DESCRIPTION: Draws a white circle centered at (203, 160) with radius 43.
; PLAN: r0=203(x), r1=160(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 160
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
