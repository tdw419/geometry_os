; DESCRIPTION: Places a yellow circle of radius 35 at center (433, 78).
; PLAN: r0=433(x), r1=78(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 78
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
