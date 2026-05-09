; DESCRIPTION: Places a orange circle of radius 47 at center (272, 166).
; PLAN: r0=272(x), r1=166(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 166
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
