; DESCRIPTION: Places a orange circle of radius 14 at center (403, 97).
; PLAN: r0=403(x), r1=97(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 97
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
