; DESCRIPTION: Places a blue circle of radius 46 at center (232, 77).
; PLAN: r0=232(x), r1=77(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 232
LDI r1, 77
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
