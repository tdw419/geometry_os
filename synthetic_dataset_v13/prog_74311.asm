; DESCRIPTION: Creates a green circular shape at (332, 97) with radius 61.
; PLAN: r0=332(x), r1=97(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 97
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
