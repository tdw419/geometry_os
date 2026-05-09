; DESCRIPTION: Places a blue circle of radius 40 at center (159, 177).
; PLAN: r0=159(x), r1=177(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 177
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
