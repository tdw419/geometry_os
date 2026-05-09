; DESCRIPTION: Places a blue circle of radius 24 at center (120, 112).
; PLAN: r0=120(x), r1=112(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 112
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
