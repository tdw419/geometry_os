; DESCRIPTION: Creates a orange circular shape at (335, 157) with radius 22.
; PLAN: r0=335(x), r1=157(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 157
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
