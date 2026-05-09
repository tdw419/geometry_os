; DESCRIPTION: Creates a white circular shape at (268, 164) with radius 71.
; PLAN: r0=268(x), r1=164(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 164
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
