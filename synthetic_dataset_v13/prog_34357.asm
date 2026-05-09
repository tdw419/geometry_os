; DESCRIPTION: Renders a purple disk with center (257, 160) and radius 48.
; PLAN: r0=257(x), r1=160(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 257
LDI r1, 160
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
