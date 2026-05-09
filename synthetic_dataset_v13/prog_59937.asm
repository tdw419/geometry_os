; DESCRIPTION: Creates a orange circular shape at (324, 77) with radius 35.
; PLAN: r0=324(x), r1=77(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 77
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
