; DESCRIPTION: Places a blue circle of radius 53 at center (247, 104).
; PLAN: r0=247(x), r1=104(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 104
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
