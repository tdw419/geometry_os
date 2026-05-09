; DESCRIPTION: Places a orange circle of radius 56 at center (377, 155).
; PLAN: r0=377(x), r1=155(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 155
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
