; DESCRIPTION: Places a orange circle of radius 18 at center (437, 144).
; PLAN: r0=437(x), r1=144(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 437
LDI r1, 144
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
