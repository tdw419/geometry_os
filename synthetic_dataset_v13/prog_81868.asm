; DESCRIPTION: Creates a white circular shape at (184, 161) with radius 29.
; PLAN: r0=184(x), r1=161(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 161
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
