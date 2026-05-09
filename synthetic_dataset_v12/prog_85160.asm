; DESCRIPTION: Creates a white circular shape at (265, 136) with radius 20.
; PLAN: r0=265(x), r1=136(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 136
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
