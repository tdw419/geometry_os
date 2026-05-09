; DESCRIPTION: Creates a orange circular shape at (163, 191) with radius 43.
; PLAN: r0=163(x), r1=191(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 191
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
