; DESCRIPTION: Places a black circle of radius 59 at center (219, 123).
; PLAN: r0=219(x), r1=123(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 123
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
