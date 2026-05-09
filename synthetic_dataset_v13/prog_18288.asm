; DESCRIPTION: Places a orange circle of radius 77 at center (383, 160).
; PLAN: r0=383(x), r1=160(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 160
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
