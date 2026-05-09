; DESCRIPTION: Draws a white circle centered at (185, 102) with radius 62.
; PLAN: r0=185(x), r1=102(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 102
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
