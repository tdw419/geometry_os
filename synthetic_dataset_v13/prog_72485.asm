; DESCRIPTION: Creates a white circular shape at (164, 86) with radius 62.
; PLAN: r0=164(x), r1=86(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 86
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
