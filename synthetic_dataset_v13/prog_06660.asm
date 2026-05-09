; DESCRIPTION: Creates a green circular shape at (334, 173) with radius 43.
; PLAN: r0=334(x), r1=173(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 173
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
