; DESCRIPTION: Places a orange circle of radius 39 at center (462, 90).
; PLAN: r0=462(x), r1=90(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 462
LDI r1, 90
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
