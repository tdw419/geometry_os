; DESCRIPTION: Places a orange circle of radius 80 at center (87, 97).
; PLAN: r0=87(x), r1=97(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 97
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
