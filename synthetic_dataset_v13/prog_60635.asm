; DESCRIPTION: Renders a blue disk with center (129, 126) and radius 46.
; PLAN: r0=129(x), r1=126(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 126
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
