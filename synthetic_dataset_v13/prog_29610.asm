; DESCRIPTION: Places a purple circle of radius 26 at center (120, 60).
; PLAN: r0=120(x), r1=60(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 60
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
