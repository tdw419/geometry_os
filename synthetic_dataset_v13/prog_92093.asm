; DESCRIPTION: Places a orange circle of radius 57 at center (94, 57).
; PLAN: r0=94(x), r1=57(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 57
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
