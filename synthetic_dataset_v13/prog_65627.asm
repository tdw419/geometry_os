; DESCRIPTION: Places a blue circle of radius 30 at center (185, 194).
; PLAN: r0=185(x), r1=194(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 194
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
