; DESCRIPTION: Renders a green disk with center (339, 90) and radius 79.
; PLAN: r0=339(x), r1=90(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 90
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
