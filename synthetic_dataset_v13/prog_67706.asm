; DESCRIPTION: Draws a white circle centered at (376, 158) with radius 62.
; PLAN: r0=376(x), r1=158(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 158
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
