; DESCRIPTION: Creates a white circular shape at (394, 126) with radius 78.
; PLAN: r0=394(x), r1=126(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 126
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
