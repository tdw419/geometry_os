; DESCRIPTION: Places a blue circle of radius 78 at center (383, 142).
; PLAN: r0=383(x), r1=142(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 142
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
