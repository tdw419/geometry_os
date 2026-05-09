; DESCRIPTION: Creates a orange circular shape at (88, 166) with radius 39.
; PLAN: r0=88(x), r1=166(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 166
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
