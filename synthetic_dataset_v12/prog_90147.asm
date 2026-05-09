; DESCRIPTION: Places a orange circle of radius 72 at center (100, 81).
; PLAN: r0=100(x), r1=81(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 81
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
