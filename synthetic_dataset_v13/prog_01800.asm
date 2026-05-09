; DESCRIPTION: Renders a black disk with center (210, 199) and radius 48.
; PLAN: r0=210(x), r1=199(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 199
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
