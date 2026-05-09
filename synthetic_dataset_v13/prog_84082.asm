; DESCRIPTION: Places a blue circle of radius 49 at center (133, 134).
; PLAN: r0=133(x), r1=134(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 134
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
