; DESCRIPTION: Places a blue circle of radius 36 at center (61, 39).
; PLAN: r0=61(x), r1=39(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 39
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
