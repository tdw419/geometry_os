; DESCRIPTION: Places a orange circle of radius 18 at center (40, 24).
; PLAN: r0=40(x), r1=24(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 24
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
