; DESCRIPTION: Places a orange circle of radius 13 at center (319, 103).
; PLAN: r0=319(x), r1=103(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 103
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
