; DESCRIPTION: Creates a orange circular shape at (382, 108) with radius 76.
; PLAN: r0=382(x), r1=108(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 108
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
