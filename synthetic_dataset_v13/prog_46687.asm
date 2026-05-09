; DESCRIPTION: Places a orange circle of radius 13 at center (122, 52).
; PLAN: r0=122(x), r1=52(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 52
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
