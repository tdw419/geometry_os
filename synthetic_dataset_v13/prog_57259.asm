; DESCRIPTION: Creates a orange circular shape at (334, 149) with radius 75.
; PLAN: r0=334(x), r1=149(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 149
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
