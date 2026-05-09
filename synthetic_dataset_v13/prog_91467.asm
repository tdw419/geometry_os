; DESCRIPTION: Renders a purple disk with center (254, 71) and radius 65.
; PLAN: r0=254(x), r1=71(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 71
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
