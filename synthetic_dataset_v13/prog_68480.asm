; DESCRIPTION: Renders a purple disk with center (467, 46) and radius 18.
; PLAN: r0=467(x), r1=46(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 467
LDI r1, 46
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
