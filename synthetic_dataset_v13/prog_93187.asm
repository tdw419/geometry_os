; DESCRIPTION: Creates a orange circular shape at (357, 81) with radius 43.
; PLAN: r0=357(x), r1=81(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 81
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
