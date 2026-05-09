; DESCRIPTION: Places a orange circle of radius 53 at center (155, 108).
; PLAN: r0=155(x), r1=108(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 108
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
