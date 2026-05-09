; DESCRIPTION: Places a orange circle of radius 57 at center (131, 163).
; PLAN: r0=131(x), r1=163(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 163
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
