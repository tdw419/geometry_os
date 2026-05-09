; DESCRIPTION: Creates a orange circular shape at (176, 99) with radius 61.
; PLAN: r0=176(x), r1=99(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 99
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
