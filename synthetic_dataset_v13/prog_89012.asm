; DESCRIPTION: Creates a white circular shape at (302, 130) with radius 79.
; PLAN: r0=302(x), r1=130(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 130
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
