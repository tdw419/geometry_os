; DESCRIPTION: Renders a blue disk with center (49, 202) and radius 13.
; PLAN: r0=49(x), r1=202(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 202
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
