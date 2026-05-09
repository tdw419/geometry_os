; DESCRIPTION: Places a orange circle of radius 77 at center (151, 84).
; PLAN: r0=151(x), r1=84(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 84
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
