; DESCRIPTION: Creates a white circular shape at (33, 42) with radius 20.
; PLAN: r0=33(x), r1=42(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 33
LDI r1, 42
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
