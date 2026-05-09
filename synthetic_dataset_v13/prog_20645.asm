; DESCRIPTION: Creates a orange circular shape at (299, 108) with radius 18.
; PLAN: r0=299(x), r1=108(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 108
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
