; DESCRIPTION: Creates a white circular shape at (285, 130) with radius 65.
; PLAN: r0=285(x), r1=130(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 130
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
