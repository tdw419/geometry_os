; DESCRIPTION: Creates a orange circular shape at (311, 98) with radius 15.
; PLAN: r0=311(x), r1=98(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 98
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
