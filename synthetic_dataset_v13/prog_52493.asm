; DESCRIPTION: Places a orange circle of radius 19 at center (94, 31).
; PLAN: r0=94(x), r1=31(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 31
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
