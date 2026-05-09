; DESCRIPTION: Renders a red disk with center (341, 167) and radius 78.
; PLAN: r0=341(x), r1=167(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 167
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
