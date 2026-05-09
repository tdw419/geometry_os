; DESCRIPTION: Creates a orange circular shape at (245, 55) with radius 39.
; PLAN: r0=245(x), r1=55(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 55
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
