; DESCRIPTION: Creates a white circular shape at (407, 130) with radius 55.
; PLAN: r0=407(x), r1=130(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 130
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
