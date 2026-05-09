; DESCRIPTION: Places a orange circle of radius 13 at center (106, 90).
; PLAN: r0=106(x), r1=90(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 90
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
