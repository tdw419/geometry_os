; DESCRIPTION: Places a blue circle of radius 31 at center (478, 173).
; PLAN: r0=478(x), r1=173(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 478
LDI r1, 173
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
