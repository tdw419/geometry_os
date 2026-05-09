; DESCRIPTION: Places a orange circle of radius 13 at center (326, 106).
; PLAN: r0=326(x), r1=106(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 106
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
