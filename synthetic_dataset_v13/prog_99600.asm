; DESCRIPTION: Places a orange circle of radius 80 at center (272, 102).
; PLAN: r0=272(x), r1=102(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 102
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
