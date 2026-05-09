; DESCRIPTION: Creates a white circular shape at (330, 130) with radius 19.
; PLAN: r0=330(x), r1=130(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 330
LDI r1, 130
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
