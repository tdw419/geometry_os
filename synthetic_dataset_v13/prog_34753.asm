; DESCRIPTION: Creates a white circular shape at (250, 154) with radius 43.
; PLAN: r0=250(x), r1=154(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 154
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
