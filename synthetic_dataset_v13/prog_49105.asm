; DESCRIPTION: Creates a white circular shape at (407, 37) with radius 28.
; PLAN: r0=407(x), r1=37(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 37
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
