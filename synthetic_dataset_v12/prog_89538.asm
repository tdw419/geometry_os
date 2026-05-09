; DESCRIPTION: Draws a white circle centered at (359, 101) with radius 10.
; PLAN: r0=359(x), r1=101(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 101
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
