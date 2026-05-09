; DESCRIPTION: Creates a orange circular shape at (98, 83) with radius 53.
; PLAN: r0=98(x), r1=83(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 83
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
