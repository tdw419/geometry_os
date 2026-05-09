; DESCRIPTION: Renders a red disk with center (364, 158) and radius 65.
; PLAN: r0=364(x), r1=158(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 158
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
