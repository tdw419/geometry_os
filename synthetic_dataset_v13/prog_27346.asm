; DESCRIPTION: Renders a blue disk with center (367, 129) and radius 66.
; PLAN: r0=367(x), r1=129(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 129
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
