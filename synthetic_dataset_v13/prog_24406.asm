; DESCRIPTION: Draws a white circle centered at (426, 78) with radius 37.
; PLAN: r0=426(x), r1=78(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 426
LDI r1, 78
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
