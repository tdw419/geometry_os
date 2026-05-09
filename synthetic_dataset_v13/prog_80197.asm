; DESCRIPTION: Creates a orange circular shape at (114, 70) with radius 35.
; PLAN: r0=114(x), r1=70(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 70
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
