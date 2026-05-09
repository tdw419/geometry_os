; DESCRIPTION: Renders a red disk with center (257, 199) and radius 43.
; PLAN: r0=257(x), r1=199(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 257
LDI r1, 199
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
