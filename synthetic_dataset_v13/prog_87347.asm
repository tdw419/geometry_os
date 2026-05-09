; DESCRIPTION: Creates a white circular shape at (423, 97) with radius 60.
; PLAN: r0=423(x), r1=97(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 97
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
