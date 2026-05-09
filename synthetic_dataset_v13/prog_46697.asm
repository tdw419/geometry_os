; DESCRIPTION: Renders a green disk with center (482, 78) and radius 24.
; PLAN: r0=482(x), r1=78(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 482
LDI r1, 78
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
