; DESCRIPTION: Places a blue circle of radius 10 at center (274, 156).
; PLAN: r0=274(x), r1=156(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 156
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
