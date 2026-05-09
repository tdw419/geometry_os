; DESCRIPTION: Creates a orange circular shape at (388, 116) with radius 40.
; PLAN: r0=388(x), r1=116(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 116
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
