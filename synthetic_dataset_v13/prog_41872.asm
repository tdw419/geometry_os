; DESCRIPTION: Creates a orange circular shape at (85, 60) with radius 40.
; PLAN: r0=85(x), r1=60(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 60
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
