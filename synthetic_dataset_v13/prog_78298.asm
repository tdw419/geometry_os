; DESCRIPTION: Renders a purple disk with center (349, 93) and radius 71.
; PLAN: r0=349(x), r1=93(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 93
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
