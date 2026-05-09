; DESCRIPTION: Creates a orange circular shape at (360, 140) with radius 76.
; PLAN: r0=360(x), r1=140(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 140
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
