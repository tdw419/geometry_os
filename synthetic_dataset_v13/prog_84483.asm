; DESCRIPTION: Creates a white circular shape at (39, 83) with radius 35.
; PLAN: r0=39(x), r1=83(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 39
LDI r1, 83
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
