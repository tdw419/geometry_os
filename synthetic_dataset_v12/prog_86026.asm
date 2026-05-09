; DESCRIPTION: Creates a orange circular shape at (439, 137) with radius 72.
; PLAN: r0=439(x), r1=137(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 137
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
