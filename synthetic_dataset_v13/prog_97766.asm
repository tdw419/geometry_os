; DESCRIPTION: Renders a blue disk with center (117, 71) and radius 30.
; PLAN: r0=117(x), r1=71(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 71
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
