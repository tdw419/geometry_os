; DESCRIPTION: Places a orange circle of radius 44 at center (126, 106).
; PLAN: r0=126(x), r1=106(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 106
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
