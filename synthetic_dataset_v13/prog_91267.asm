; DESCRIPTION: Renders a purple disk with center (69, 167) and radius 13.
; PLAN: r0=69(x), r1=167(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 167
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
