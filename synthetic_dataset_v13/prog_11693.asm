; DESCRIPTION: Renders a green disk with center (265, 139) and radius 48.
; PLAN: r0=265(x), r1=139(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 139
LDI r2, 48
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
