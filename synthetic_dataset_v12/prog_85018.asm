; DESCRIPTION: Draws a white circle centered at (26, 82) with radius 23.
; PLAN: r0=26(x), r1=82(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 26
LDI r1, 82
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
