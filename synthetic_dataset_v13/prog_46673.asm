; DESCRIPTION: Draws a white circle centered at (102, 86) with radius 69.
; PLAN: r0=102(x), r1=86(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 86
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
