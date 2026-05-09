; DESCRIPTION: Creates a orange circular shape at (472, 110) with radius 28.
; PLAN: r0=472(x), r1=110(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 472
LDI r1, 110
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
