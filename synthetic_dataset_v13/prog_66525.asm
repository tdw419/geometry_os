; DESCRIPTION: Places a orange circle of radius 49 at center (449, 106).
; PLAN: r0=449(x), r1=106(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 106
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
