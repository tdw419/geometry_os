; DESCRIPTION: Places a blue circle of radius 46 at center (53, 81).
; PLAN: r0=53(x), r1=81(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 81
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
