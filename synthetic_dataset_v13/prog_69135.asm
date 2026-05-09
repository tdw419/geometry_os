; DESCRIPTION: Creates a orange circular shape at (216, 176) with radius 62.
; PLAN: r0=216(x), r1=176(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 176
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
