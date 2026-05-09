; DESCRIPTION: Creates a white circular shape at (427, 67) with radius 45.
; PLAN: r0=427(x), r1=67(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 67
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
