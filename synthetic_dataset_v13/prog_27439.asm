; DESCRIPTION: Renders a blue disk with center (418, 194) and radius 53.
; PLAN: r0=418(x), r1=194(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 194
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
