; DESCRIPTION: Renders a red disk with center (417, 86) and radius 72.
; PLAN: r0=417(x), r1=86(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 86
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
