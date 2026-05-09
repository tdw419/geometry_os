; DESCRIPTION: Draws a white circle centered at (408, 122) with radius 28.
; PLAN: r0=408(x), r1=122(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 122
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
