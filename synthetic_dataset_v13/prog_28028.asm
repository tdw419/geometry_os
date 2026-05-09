; DESCRIPTION: Places a orange circle of radius 56 at center (134, 62).
; PLAN: r0=134(x), r1=62(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 62
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
