; DESCRIPTION: Renders a green disk with center (143, 136) and radius 57.
; PLAN: r0=143(x), r1=136(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 136
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
