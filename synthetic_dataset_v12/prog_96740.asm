; DESCRIPTION: Places a orange circle of radius 40 at center (250, 62).
; PLAN: r0=250(x), r1=62(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 62
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
