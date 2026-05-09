; DESCRIPTION: Places a orange circle of radius 26 at center (109, 72).
; PLAN: r0=109(x), r1=72(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 72
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
