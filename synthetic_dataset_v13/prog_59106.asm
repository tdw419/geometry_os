; DESCRIPTION: Renders a white disk with center (458, 99) and radius 19.
; PLAN: r0=458(x), r1=99(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 458
LDI r1, 99
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
