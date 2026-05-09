; DESCRIPTION: Places a orange circle of radius 57 at center (211, 158).
; PLAN: r0=211(x), r1=158(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 158
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
