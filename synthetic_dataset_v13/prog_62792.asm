; DESCRIPTION: Places a orange circle of radius 77 at center (226, 139).
; PLAN: r0=226(x), r1=139(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 139
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
