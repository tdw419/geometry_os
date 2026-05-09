; DESCRIPTION: Creates a white circular shape at (346, 123) with radius 56.
; PLAN: r0=346(x), r1=123(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 123
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
