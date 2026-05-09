; DESCRIPTION: Places a orange circle of radius 54 at center (261, 184).
; PLAN: r0=261(x), r1=184(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 184
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
