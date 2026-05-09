; DESCRIPTION: Renders a purple disk with center (382, 82) and radius 46.
; PLAN: r0=382(x), r1=82(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 82
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
