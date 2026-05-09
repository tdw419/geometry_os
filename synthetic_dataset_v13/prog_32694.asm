; DESCRIPTION: Creates a white circular shape at (79, 119) with radius 60.
; PLAN: r0=79(x), r1=119(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 119
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
