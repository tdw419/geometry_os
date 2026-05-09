; DESCRIPTION: Draws a white circle centered at (102, 148) with radius 35.
; PLAN: r0=102(x), r1=148(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 148
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
