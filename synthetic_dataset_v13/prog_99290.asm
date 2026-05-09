; DESCRIPTION: Places a orange circle of radius 72 at center (155, 74).
; PLAN: r0=155(x), r1=74(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 74
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
