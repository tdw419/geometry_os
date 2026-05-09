; DESCRIPTION: Places a orange circle of radius 39 at center (447, 156).
; PLAN: r0=447(x), r1=156(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 156
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
