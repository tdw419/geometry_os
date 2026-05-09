; DESCRIPTION: Draws a white circle centered at (309, 154) with radius 14.
; PLAN: r0=309(x), r1=154(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 154
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
