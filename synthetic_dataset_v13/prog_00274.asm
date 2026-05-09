; DESCRIPTION: Places a blue circle of radius 61 at center (338, 101).
; PLAN: r0=338(x), r1=101(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 101
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
