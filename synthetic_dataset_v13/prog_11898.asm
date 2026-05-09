; DESCRIPTION: Places a orange circle of radius 61 at center (315, 80).
; PLAN: r0=315(x), r1=80(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 80
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
