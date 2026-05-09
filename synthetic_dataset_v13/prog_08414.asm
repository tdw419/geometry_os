; DESCRIPTION: Creates a orange circular shape at (409, 166) with radius 35.
; PLAN: r0=409(x), r1=166(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 166
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
