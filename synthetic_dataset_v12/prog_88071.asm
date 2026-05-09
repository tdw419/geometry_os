; DESCRIPTION: Creates a white circular shape at (283, 68) with radius 57.
; PLAN: r0=283(x), r1=68(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 68
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
