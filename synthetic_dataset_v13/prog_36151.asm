; DESCRIPTION: Places a orange circle of radius 59 at center (400, 97).
; PLAN: r0=400(x), r1=97(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 97
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
