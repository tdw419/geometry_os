; DESCRIPTION: Places a orange circle of radius 22 at center (54, 191).
; PLAN: r0=54(x), r1=191(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 191
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
