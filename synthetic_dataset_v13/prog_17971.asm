; DESCRIPTION: Renders a red disk with center (351, 90) and radius 40.
; PLAN: r0=351(x), r1=90(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 90
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
