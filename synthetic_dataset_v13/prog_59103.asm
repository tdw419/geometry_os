; DESCRIPTION: Creates a orange circular shape at (268, 75) with radius 20.
; PLAN: r0=268(x), r1=75(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 75
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
