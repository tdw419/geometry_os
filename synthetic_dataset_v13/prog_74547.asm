; DESCRIPTION: Renders a purple disk with center (393, 140) and radius 55.
; PLAN: r0=393(x), r1=140(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 140
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
