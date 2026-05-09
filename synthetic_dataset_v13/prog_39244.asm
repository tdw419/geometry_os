; DESCRIPTION: Renders a red disk with center (417, 105) and radius 31.
; PLAN: r0=417(x), r1=105(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 105
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
