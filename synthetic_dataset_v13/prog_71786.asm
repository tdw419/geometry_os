; DESCRIPTION: Renders a blue disk with center (458, 99) and radius 54.
; PLAN: r0=458(x), r1=99(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 458
LDI r1, 99
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
