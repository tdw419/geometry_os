; DESCRIPTION: Creates a green circular shape at (217, 86) with radius 14.
; PLAN: r0=217(x), r1=86(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 86
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
