; DESCRIPTION: Creates a white circular shape at (457, 100) with radius 32.
; PLAN: r0=457(x), r1=100(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 457
LDI r1, 100
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
