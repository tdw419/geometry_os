; DESCRIPTION: Places a orange circle of radius 15 at center (452, 240).
; PLAN: r0=452(x), r1=240(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 452
LDI r1, 240
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
