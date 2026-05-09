; DESCRIPTION: Renders a purple disk with center (256, 141) and radius 71.
; PLAN: r0=256(x), r1=141(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 141
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
