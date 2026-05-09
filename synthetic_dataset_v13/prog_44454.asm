; DESCRIPTION: Places a orange circle of radius 60 at center (377, 114).
; PLAN: r0=377(x), r1=114(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 114
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
