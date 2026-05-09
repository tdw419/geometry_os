; DESCRIPTION: Places a purple circle of radius 10 at center (310, 214).
; PLAN: r0=310(x), r1=214(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 310
LDI r1, 214
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
