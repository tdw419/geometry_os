; DESCRIPTION: Draws a white circle centered at (370, 76) with radius 69.
; PLAN: r0=370(x), r1=76(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 76
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
