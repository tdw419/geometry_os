; DESCRIPTION: Creates a white circular shape at (321, 158) with radius 70.
; PLAN: r0=321(x), r1=158(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 158
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
