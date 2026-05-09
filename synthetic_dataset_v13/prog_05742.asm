; DESCRIPTION: Creates a orange circular shape at (338, 71) with radius 62.
; PLAN: r0=338(x), r1=71(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 71
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
