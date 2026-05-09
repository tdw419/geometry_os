; DESCRIPTION: Creates a orange circular shape at (106, 90) with radius 75.
; PLAN: r0=106(x), r1=90(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 90
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
