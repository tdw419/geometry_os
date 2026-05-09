; DESCRIPTION: Renders a red disk with center (431, 76) and radius 73.
; PLAN: r0=431(x), r1=76(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 76
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
