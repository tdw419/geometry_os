; DESCRIPTION: Places a orange circle of radius 44 at center (197, 201).
; PLAN: r0=197(x), r1=201(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 201
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
