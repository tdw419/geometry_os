; DESCRIPTION: Places a orange circle of radius 18 at center (77, 22).
; PLAN: r0=77(x), r1=22(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 22
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
