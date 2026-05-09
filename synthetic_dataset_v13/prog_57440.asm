; DESCRIPTION: Creates a orange circular shape at (303, 78) with radius 75.
; PLAN: r0=303(x), r1=78(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 78
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
