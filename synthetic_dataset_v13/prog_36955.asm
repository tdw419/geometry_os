; DESCRIPTION: Creates a orange circular shape at (314, 43) with radius 38.
; PLAN: r0=314(x), r1=43(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 43
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
