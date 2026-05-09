; DESCRIPTION: Renders a green disk with center (349, 163) and radius 47.
; PLAN: r0=349(x), r1=163(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 163
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
