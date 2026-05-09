; DESCRIPTION: Creates a white circular shape at (466, 79) with radius 14.
; PLAN: r0=466(x), r1=79(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 466
LDI r1, 79
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
