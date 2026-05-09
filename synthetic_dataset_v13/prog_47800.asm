; DESCRIPTION: Draws a white circle centered at (274, 115) with radius 68.
; PLAN: r0=274(x), r1=115(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 115
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
