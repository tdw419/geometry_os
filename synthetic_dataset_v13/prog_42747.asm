; DESCRIPTION: Places a blue circle of radius 56 at center (159, 193).
; PLAN: r0=159(x), r1=193(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 193
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
