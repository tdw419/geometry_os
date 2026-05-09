; DESCRIPTION: Renders a blue disk with center (302, 74) and radius 45.
; PLAN: r0=302(x), r1=74(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 74
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
