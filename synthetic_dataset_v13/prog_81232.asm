; DESCRIPTION: Places a orange circle of radius 24 at center (334, 112).
; PLAN: r0=334(x), r1=112(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 112
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
