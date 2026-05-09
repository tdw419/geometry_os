; DESCRIPTION: Places a orange circle of radius 17 at center (77, 140).
; PLAN: r0=77(x), r1=140(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 140
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
