; DESCRIPTION: Places a purple circle of radius 79 at center (120, 100).
; PLAN: r0=120(x), r1=100(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 100
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
