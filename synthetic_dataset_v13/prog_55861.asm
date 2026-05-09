; DESCRIPTION: Creates a white circular shape at (276, 171) with radius 21.
; PLAN: r0=276(x), r1=171(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 171
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
