; DESCRIPTION: Creates a white circular shape at (259, 134) with radius 71.
; PLAN: r0=259(x), r1=134(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 134
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
