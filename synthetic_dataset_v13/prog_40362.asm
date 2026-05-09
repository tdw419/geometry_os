; DESCRIPTION: Places a yellow circle of radius 23 at center (24, 218).
; PLAN: r0=24(x), r1=218(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 24
LDI r1, 218
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
