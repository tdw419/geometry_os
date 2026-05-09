; DESCRIPTION: Renders a blue disk with center (134, 115) and radius 50.
; PLAN: r0=134(x), r1=115(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 115
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
