; DESCRIPTION: Creates a orange circular shape at (388, 28) with radius 15.
; PLAN: r0=388(x), r1=28(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 28
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
