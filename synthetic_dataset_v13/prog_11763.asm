; DESCRIPTION: Creates a orange circular shape at (222, 227) with radius 17.
; PLAN: r0=222(x), r1=227(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 227
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
