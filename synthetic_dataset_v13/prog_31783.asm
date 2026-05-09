; DESCRIPTION: Places a yellow circle of radius 48 at center (396, 100).
; PLAN: r0=396(x), r1=100(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 100
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
