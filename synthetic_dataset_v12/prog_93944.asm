; DESCRIPTION: Renders a blue disk with center (354, 77) and radius 74.
; PLAN: r0=354(x), r1=77(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 77
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
