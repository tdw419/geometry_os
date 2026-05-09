; DESCRIPTION: Creates a orange circular shape at (85, 102) with radius 59.
; PLAN: r0=85(x), r1=102(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 102
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
