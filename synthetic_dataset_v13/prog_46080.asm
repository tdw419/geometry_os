; DESCRIPTION: Places a black circle of radius 75 at center (170, 149).
; PLAN: r0=170(x), r1=149(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 149
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
