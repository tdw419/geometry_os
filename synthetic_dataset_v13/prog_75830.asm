; DESCRIPTION: Renders a red disk with center (363, 34) and radius 17.
; PLAN: r0=363(x), r1=34(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 34
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
