; DESCRIPTION: Places a orange circle of radius 16 at center (56, 44).
; PLAN: r0=56(x), r1=44(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 44
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
