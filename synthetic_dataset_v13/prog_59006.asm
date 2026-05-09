; DESCRIPTION: Creates a orange circular shape at (346, 101) with radius 76.
; PLAN: r0=346(x), r1=101(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 101
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
