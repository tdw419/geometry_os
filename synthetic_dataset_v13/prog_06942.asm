; DESCRIPTION: Creates a white circular shape at (134, 195) with radius 33.
; PLAN: r0=134(x), r1=195(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 195
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
