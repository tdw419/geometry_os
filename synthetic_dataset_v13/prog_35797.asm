; DESCRIPTION: Creates a orange circular shape at (281, 97) with radius 76.
; PLAN: r0=281(x), r1=97(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 97
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
