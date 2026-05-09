; DESCRIPTION: Draws a white circle centered at (426, 154) with radius 69.
; PLAN: r0=426(x), r1=154(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 426
LDI r1, 154
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
