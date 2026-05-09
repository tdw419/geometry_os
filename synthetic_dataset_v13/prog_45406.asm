; DESCRIPTION: Draws a white circle centered at (233, 114) with radius 72.
; PLAN: r0=233(x), r1=114(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 114
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
