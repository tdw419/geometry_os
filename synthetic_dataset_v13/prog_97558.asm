; DESCRIPTION: Creates a orange circular shape at (161, 110) with radius 78.
; PLAN: r0=161(x), r1=110(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 110
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
