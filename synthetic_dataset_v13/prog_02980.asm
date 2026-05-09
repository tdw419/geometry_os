; DESCRIPTION: Creates a white circular shape at (336, 151) with radius 62.
; PLAN: r0=336(x), r1=151(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 151
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
