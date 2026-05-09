; DESCRIPTION: Renders a green disk with center (374, 129) and radius 56.
; PLAN: r0=374(x), r1=129(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 129
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
