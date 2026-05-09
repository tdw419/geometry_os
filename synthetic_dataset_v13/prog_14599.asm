; DESCRIPTION: Renders a blue disk with center (225, 178) and radius 73.
; PLAN: r0=225(x), r1=178(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 178
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
