; DESCRIPTION: Draws a white circle centered at (111, 122) with radius 59.
; PLAN: r0=111(x), r1=122(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 122
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
