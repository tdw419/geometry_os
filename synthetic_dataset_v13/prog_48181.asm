; DESCRIPTION: Creates a orange circular shape at (194, 149) with radius 15.
; PLAN: r0=194(x), r1=149(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 149
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
