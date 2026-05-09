; DESCRIPTION: Places a yellow circle of radius 56 at center (91, 200).
; PLAN: r0=91(x), r1=200(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 200
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
