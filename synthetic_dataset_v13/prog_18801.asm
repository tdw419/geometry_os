; DESCRIPTION: Creates a orange circular shape at (288, 200) with radius 39.
; PLAN: r0=288(x), r1=200(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 200
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
