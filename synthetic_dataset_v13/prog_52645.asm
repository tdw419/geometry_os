; DESCRIPTION: Places a orange circle of radius 71 at center (203, 148).
; PLAN: r0=203(x), r1=148(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 148
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
