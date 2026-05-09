; DESCRIPTION: Places a blue circle of radius 53 at center (372, 183).
; PLAN: r0=372(x), r1=183(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 183
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
