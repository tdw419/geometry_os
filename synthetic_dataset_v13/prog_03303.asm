; DESCRIPTION: Draws a white circle centered at (201, 154) with radius 62.
; PLAN: r0=201(x), r1=154(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 154
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
