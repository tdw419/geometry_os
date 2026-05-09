; DESCRIPTION: Places a red circle of radius 40 at center (119, 84).
; PLAN: r0=119(x), r1=84(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 84
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
