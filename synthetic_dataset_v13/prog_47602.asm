; DESCRIPTION: Creates a white circular shape at (105, 241) with radius 13.
; PLAN: r0=105(x), r1=241(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 241
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
