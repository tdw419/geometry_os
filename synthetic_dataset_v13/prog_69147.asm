; DESCRIPTION: Renders a blue disk with center (365, 183) and radius 70.
; PLAN: r0=365(x), r1=183(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 183
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
