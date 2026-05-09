; DESCRIPTION: Creates a white circular shape at (321, 83) with radius 35.
; PLAN: r0=321(x), r1=83(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 83
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
