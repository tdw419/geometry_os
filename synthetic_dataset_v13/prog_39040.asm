; DESCRIPTION: Creates a orange circular shape at (216, 95) with radius 37.
; PLAN: r0=216(x), r1=95(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 95
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
