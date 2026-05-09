; DESCRIPTION: Places a blue circle of radius 21 at center (159, 226).
; PLAN: r0=159(x), r1=226(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 226
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
