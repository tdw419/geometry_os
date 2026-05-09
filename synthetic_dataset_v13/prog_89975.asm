; DESCRIPTION: Creates a orange circular shape at (418, 137) with radius 68.
; PLAN: r0=418(x), r1=137(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 137
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
