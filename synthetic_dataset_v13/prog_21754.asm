; DESCRIPTION: Creates a white circular shape at (401, 144) with radius 75.
; PLAN: r0=401(x), r1=144(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 144
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
