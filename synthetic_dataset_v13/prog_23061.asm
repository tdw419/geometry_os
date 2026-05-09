; DESCRIPTION: Renders a blue disk with center (113, 66) and radius 37.
; PLAN: r0=113(x), r1=66(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 66
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
