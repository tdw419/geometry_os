; DESCRIPTION: Renders a blue disk with center (81, 151) and radius 65.
; PLAN: r0=81(x), r1=151(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 151
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
