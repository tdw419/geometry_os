; DESCRIPTION: Renders a black disk with center (209, 216) and radius 12.
; PLAN: r0=209(x), r1=216(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 216
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
