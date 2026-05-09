; DESCRIPTION: Renders a red disk with center (273, 110) and radius 71.
; PLAN: r0=273(x), r1=110(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 110
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
