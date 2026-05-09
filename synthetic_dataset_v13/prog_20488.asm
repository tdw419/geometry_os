; DESCRIPTION: Creates a white circular shape at (457, 168) with radius 49.
; PLAN: r0=457(x), r1=168(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 457
LDI r1, 168
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
