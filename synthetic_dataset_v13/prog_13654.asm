; DESCRIPTION: Renders a red disk with center (122, 167) and radius 47.
; PLAN: r0=122(x), r1=167(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 167
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
