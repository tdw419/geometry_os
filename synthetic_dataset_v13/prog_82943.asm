; DESCRIPTION: Places a yellow circle of radius 14 at center (151, 225).
; PLAN: r0=151(x), r1=225(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 225
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
