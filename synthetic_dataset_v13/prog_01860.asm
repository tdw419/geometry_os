; DESCRIPTION: Draws a white circle centered at (131, 125) with radius 62.
; PLAN: r0=131(x), r1=125(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 125
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
