; DESCRIPTION: Places a blue circle of radius 76 at center (266, 93).
; PLAN: r0=266(x), r1=93(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 93
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
