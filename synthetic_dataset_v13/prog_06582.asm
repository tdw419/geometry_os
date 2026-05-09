; DESCRIPTION: Creates a white circular shape at (42, 184) with radius 22.
; PLAN: r0=42(x), r1=184(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 184
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
