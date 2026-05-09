; DESCRIPTION: Places a yellow circle of radius 78 at center (209, 119).
; PLAN: r0=209(x), r1=119(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 119
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
