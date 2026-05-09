; DESCRIPTION: Places a green circle of radius 44 at center (102, 122).
; PLAN: r0=102(x), r1=122(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 122
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
