; DESCRIPTION: Creates a orange circular shape at (143, 238) with radius 10.
; PLAN: r0=143(x), r1=238(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 238
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
