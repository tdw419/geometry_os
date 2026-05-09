; DESCRIPTION: Places a blue circle of radius 14 at center (466, 30).
; PLAN: r0=466(x), r1=30(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 466
LDI r1, 30
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
