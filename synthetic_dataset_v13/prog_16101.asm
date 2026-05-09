; DESCRIPTION: Places a orange circle of radius 22 at center (375, 76).
; PLAN: r0=375(x), r1=76(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 76
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
