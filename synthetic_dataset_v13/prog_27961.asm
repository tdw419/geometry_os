; DESCRIPTION: Places a orange circle of radius 11 at center (431, 190).
; PLAN: r0=431(x), r1=190(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 190
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
