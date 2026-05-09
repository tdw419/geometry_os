; DESCRIPTION: Places a black circle of radius 15 at center (115, 68).
; PLAN: r0=115(x), r1=68(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 68
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
