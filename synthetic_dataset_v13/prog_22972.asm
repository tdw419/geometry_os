; DESCRIPTION: Renders a red disk with center (144, 167) and radius 73.
; PLAN: r0=144(x), r1=167(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 167
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
