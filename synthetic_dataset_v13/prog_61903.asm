; DESCRIPTION: Places a yellow circle of radius 21 at center (321, 219).
; PLAN: r0=321(x), r1=219(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 219
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
