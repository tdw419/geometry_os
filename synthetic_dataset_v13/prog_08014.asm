; DESCRIPTION: Draws a white circle centered at (179, 174) with radius 62.
; PLAN: r0=179(x), r1=174(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 174
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
