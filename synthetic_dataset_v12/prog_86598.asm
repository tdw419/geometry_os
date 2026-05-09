; DESCRIPTION: Creates a white circular shape at (407, 126) with radius 79.
; PLAN: r0=407(x), r1=126(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 126
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
