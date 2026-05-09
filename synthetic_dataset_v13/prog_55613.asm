; DESCRIPTION: Renders a green disk with center (194, 93) and radius 72.
; PLAN: r0=194(x), r1=93(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 93
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
