; DESCRIPTION: Renders a green disk with center (47, 64) and radius 28.
; PLAN: r0=47(x), r1=64(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 47
LDI r1, 64
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
