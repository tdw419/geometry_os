; DESCRIPTION: Places a yellow circle of radius 21 at center (120, 84).
; PLAN: r0=120(x), r1=84(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 84
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
