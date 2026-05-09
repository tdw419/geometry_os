; DESCRIPTION: Places a orange circle of radius 76 at center (122, 138).
; PLAN: r0=122(x), r1=138(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 138
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
