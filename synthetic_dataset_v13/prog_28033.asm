; DESCRIPTION: Places a black circle of radius 68 at center (138, 99).
; PLAN: r0=138(x), r1=99(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 99
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
