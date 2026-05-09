; DESCRIPTION: Creates a white circular shape at (105, 204) with radius 47.
; PLAN: r0=105(x), r1=204(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 204
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
