; DESCRIPTION: Places a black circle of radius 11 at center (166, 59).
; PLAN: r0=166(x), r1=59(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 59
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
