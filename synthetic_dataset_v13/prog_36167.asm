; DESCRIPTION: Creates a orange circular shape at (171, 14) with radius 10.
; PLAN: r0=171(x), r1=14(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 14
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
