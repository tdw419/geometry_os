; DESCRIPTION: Creates a white circular shape at (319, 130) with radius 76.
; PLAN: r0=319(x), r1=130(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 130
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
