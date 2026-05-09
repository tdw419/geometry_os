; DESCRIPTION: Renders a blue disk with center (386, 176) and radius 76.
; PLAN: r0=386(x), r1=176(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 176
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
