; DESCRIPTION: Renders a red disk with center (458, 124) and radius 15.
; PLAN: r0=458(x), r1=124(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 458
LDI r1, 124
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
