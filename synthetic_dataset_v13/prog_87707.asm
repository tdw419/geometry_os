; DESCRIPTION: Creates a orange circular shape at (85, 113) with radius 10.
; PLAN: r0=85(x), r1=113(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 113
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
