; DESCRIPTION: Renders a yellow disk with center (435, 177) and radius 52.
; PLAN: r0=435(x), r1=177(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 177
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
