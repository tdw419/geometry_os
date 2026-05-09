; DESCRIPTION: Places a blue circle of radius 76 at center (274, 126).
; PLAN: r0=274(x), r1=126(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 126
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
