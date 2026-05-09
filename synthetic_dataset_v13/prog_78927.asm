; DESCRIPTION: Creates a orange circular shape at (295, 191) with radius 59.
; PLAN: r0=295(x), r1=191(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 191
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
