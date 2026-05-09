; DESCRIPTION: Renders a blue disk with center (118, 166) and radius 66.
; PLAN: r0=118(x), r1=166(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 166
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
