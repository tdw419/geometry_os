; DESCRIPTION: Places a orange circle of radius 19 at center (420, 34).
; PLAN: r0=420(x), r1=34(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 34
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
