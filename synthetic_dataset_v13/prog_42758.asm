; DESCRIPTION: Renders a red disk with center (179, 158) and radius 66.
; PLAN: r0=179(x), r1=158(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 158
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
