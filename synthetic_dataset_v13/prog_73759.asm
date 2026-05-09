; DESCRIPTION: Places a orange circle of radius 34 at center (59, 216).
; PLAN: r0=59(x), r1=216(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 216
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
