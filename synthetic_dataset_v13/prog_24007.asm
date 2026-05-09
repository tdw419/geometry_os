; DESCRIPTION: Creates a orange circular shape at (171, 100) with radius 16.
; PLAN: r0=171(x), r1=100(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 100
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
