; DESCRIPTION: Creates a green circular shape at (459, 171) with radius 37.
; PLAN: r0=459(x), r1=171(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 459
LDI r1, 171
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
