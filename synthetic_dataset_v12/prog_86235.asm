; DESCRIPTION: Creates a orange circular shape at (183, 69) with radius 13.
; PLAN: r0=183(x), r1=69(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 69
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
