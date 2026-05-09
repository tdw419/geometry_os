; DESCRIPTION: Renders a green disk with center (335, 45) and radius 24.
; PLAN: r0=335(x), r1=45(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 45
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
