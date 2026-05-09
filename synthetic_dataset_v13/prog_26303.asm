; DESCRIPTION: Creates a white circular shape at (299, 154) with radius 77.
; PLAN: r0=299(x), r1=154(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 154
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
