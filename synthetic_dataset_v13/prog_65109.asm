; DESCRIPTION: Creates a orange circular shape at (466, 113) with radius 33.
; PLAN: r0=466(x), r1=113(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 466
LDI r1, 113
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
