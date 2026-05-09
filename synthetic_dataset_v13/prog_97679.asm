; DESCRIPTION: Renders a blue disk with center (323, 129) and radius 37.
; PLAN: r0=323(x), r1=129(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 129
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
