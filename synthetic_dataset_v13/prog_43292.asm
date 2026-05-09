; DESCRIPTION: Places a orange circle of radius 19 at center (29, 56).
; PLAN: r0=29(x), r1=56(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 29
LDI r1, 56
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
