; DESCRIPTION: Draws a white circle centered at (245, 81) with radius 11.
; PLAN: r0=245(x), r1=81(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 81
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
