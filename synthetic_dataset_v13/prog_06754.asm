; DESCRIPTION: Renders a green disk with center (61, 73) and radius 37.
; PLAN: r0=61(x), r1=73(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 73
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
