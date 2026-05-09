; DESCRIPTION: Creates a white circular shape at (430, 32) with radius 17.
; PLAN: r0=430(x), r1=32(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 32
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
