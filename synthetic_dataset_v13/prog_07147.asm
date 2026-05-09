; DESCRIPTION: Creates a orange circular shape at (179, 170) with radius 48.
; PLAN: r0=179(x), r1=170(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 170
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
