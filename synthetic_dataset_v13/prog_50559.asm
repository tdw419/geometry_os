; DESCRIPTION: Creates a orange circular shape at (281, 176) with radius 23.
; PLAN: r0=281(x), r1=176(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 176
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
