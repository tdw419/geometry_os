; DESCRIPTION: Draws a white circle centered at (134, 107) with radius 76.
; PLAN: r0=134(x), r1=107(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 107
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
