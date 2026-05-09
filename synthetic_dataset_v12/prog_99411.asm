; DESCRIPTION: Creates a red circular shape at (334, 144) with radius 78.
; PLAN: r0=334(x), r1=144(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 144
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
