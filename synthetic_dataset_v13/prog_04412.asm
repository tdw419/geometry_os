; DESCRIPTION: Places a orange circle of radius 44 at center (350, 102).
; PLAN: r0=350(x), r1=102(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 102
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
