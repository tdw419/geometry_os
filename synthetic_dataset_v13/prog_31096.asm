; DESCRIPTION: Places a orange circle of radius 10 at center (99, 49).
; PLAN: r0=99(x), r1=49(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 49
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
