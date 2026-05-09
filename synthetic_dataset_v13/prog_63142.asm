; DESCRIPTION: Places a black circle of radius 23 at center (54, 123).
; PLAN: r0=54(x), r1=123(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 123
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
