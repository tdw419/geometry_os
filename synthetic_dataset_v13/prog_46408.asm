; DESCRIPTION: Renders a blue disk with center (287, 45) and radius 26.
; PLAN: r0=287(x), r1=45(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 45
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
