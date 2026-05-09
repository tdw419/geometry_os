; DESCRIPTION: Renders a blue disk with center (257, 122) and radius 56.
; PLAN: r0=257(x), r1=122(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 257
LDI r1, 122
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
