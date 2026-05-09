; DESCRIPTION: Creates a green circular shape at (85, 175) with radius 77.
; PLAN: r0=85(x), r1=175(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 175
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
