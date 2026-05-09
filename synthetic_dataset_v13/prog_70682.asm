; DESCRIPTION: Creates a white circular shape at (468, 67) with radius 24.
; PLAN: r0=468(x), r1=67(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 468
LDI r1, 67
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
