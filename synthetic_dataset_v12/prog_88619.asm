; DESCRIPTION: Creates a white circular shape at (247, 161) with radius 10.
; PLAN: r0=247(x), r1=161(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 161
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
