; DESCRIPTION: Renders a blue disk with center (251, 141) and radius 12.
; PLAN: r0=251(x), r1=141(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 141
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
