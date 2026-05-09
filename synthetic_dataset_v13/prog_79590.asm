; DESCRIPTION: Places a orange circle of radius 56 at center (381, 187).
; PLAN: r0=381(x), r1=187(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 187
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
