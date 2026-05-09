; DESCRIPTION: Creates a orange circular shape at (258, 116) with radius 46.
; PLAN: r0=258(x), r1=116(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 116
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
