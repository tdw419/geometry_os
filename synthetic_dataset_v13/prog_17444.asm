; DESCRIPTION: Places a blue circle of radius 35 at center (90, 37).
; PLAN: r0=90(x), r1=37(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 37
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
