; DESCRIPTION: Renders a blue disk with center (210, 81) and radius 52.
; PLAN: r0=210(x), r1=81(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 81
LDI r2, 52
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
