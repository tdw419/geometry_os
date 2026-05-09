; DESCRIPTION: Creates a white circular shape at (256, 94) with radius 76.
; PLAN: r0=256(x), r1=94(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 94
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
