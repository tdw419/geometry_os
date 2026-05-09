; DESCRIPTION: Renders a green disk with center (324, 157) and radius 53.
; PLAN: r0=324(x), r1=157(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 157
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
