; DESCRIPTION: Renders a purple disk with center (138, 128) and radius 71.
; PLAN: r0=138(x), r1=128(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 128
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
