; DESCRIPTION: Creates a white circular shape at (280, 17) with radius 15.
; PLAN: r0=280(x), r1=17(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 280
LDI r1, 17
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
