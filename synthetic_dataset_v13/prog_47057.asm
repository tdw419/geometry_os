; DESCRIPTION: Creates a orange circular shape at (227, 141) with radius 49.
; PLAN: r0=227(x), r1=141(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 141
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
