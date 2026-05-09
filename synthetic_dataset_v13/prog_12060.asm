; DESCRIPTION: Places a purple circle of radius 34 at center (257, 118).
; PLAN: r0=257(x), r1=118(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 257
LDI r1, 118
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
