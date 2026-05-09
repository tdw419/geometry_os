; DESCRIPTION: Places a orange circle of radius 25 at center (34, 117).
; PLAN: r0=34(x), r1=117(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 34
LDI r1, 117
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
