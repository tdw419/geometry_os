; DESCRIPTION: Places a yellow circle of radius 15 at center (254, 99).
; PLAN: r0=254(x), r1=99(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 99
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
