; DESCRIPTION: Creates a orange circular shape at (430, 73) with radius 10.
; PLAN: r0=430(x), r1=73(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 73
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
