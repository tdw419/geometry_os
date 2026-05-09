; DESCRIPTION: Creates a orange circular shape at (384, 102) with radius 78.
; PLAN: r0=384(x), r1=102(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 102
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
