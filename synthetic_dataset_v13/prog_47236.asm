; DESCRIPTION: Places a black circle of radius 70 at center (99, 101).
; PLAN: r0=99(x), r1=101(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 101
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
