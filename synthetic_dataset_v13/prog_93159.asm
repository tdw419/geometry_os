; DESCRIPTION: Creates a orange circular shape at (45, 191) with radius 14.
; PLAN: r0=45(x), r1=191(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 191
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
