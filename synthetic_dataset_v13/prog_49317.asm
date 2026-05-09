; DESCRIPTION: Draws a white circle centered at (101, 82) with radius 78.
; PLAN: r0=101(x), r1=82(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 82
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
