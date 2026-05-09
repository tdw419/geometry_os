; DESCRIPTION: Renders a red disk with center (269, 75) and radius 66.
; PLAN: r0=269(x), r1=75(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 269
LDI r1, 75
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
