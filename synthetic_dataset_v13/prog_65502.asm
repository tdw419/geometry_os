; DESCRIPTION: Renders a black disk with center (458, 210) and radius 14.
; PLAN: r0=458(x), r1=210(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 458
LDI r1, 210
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
