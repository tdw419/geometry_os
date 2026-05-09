; DESCRIPTION: Places a blue circle of radius 60 at center (185, 181).
; PLAN: r0=185(x), r1=181(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 181
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
