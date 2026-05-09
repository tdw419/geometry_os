; DESCRIPTION: Creates a white circular shape at (204, 128) with radius 68.
; PLAN: r0=204(x), r1=128(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 128
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
