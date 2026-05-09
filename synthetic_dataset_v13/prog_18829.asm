; DESCRIPTION: Renders a blue disk with center (340, 177) and radius 48.
; PLAN: r0=340(x), r1=177(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 177
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
