; DESCRIPTION: Creates a orange circular shape at (195, 83) with radius 34.
; PLAN: r0=195(x), r1=83(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 83
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
