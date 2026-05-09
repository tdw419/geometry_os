; DESCRIPTION: Creates a orange circular shape at (216, 151) with radius 33.
; PLAN: r0=216(x), r1=151(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 151
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
