; DESCRIPTION: Renders a blue disk with center (137, 82) and radius 74.
; PLAN: r0=137(x), r1=82(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 82
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
