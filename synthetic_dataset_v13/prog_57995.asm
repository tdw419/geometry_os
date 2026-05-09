; DESCRIPTION: Renders a red disk with center (297, 167) and radius 10.
; PLAN: r0=297(x), r1=167(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 297
LDI r1, 167
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
