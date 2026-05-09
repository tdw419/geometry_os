; DESCRIPTION: Renders a green disk with center (101, 167) and radius 71.
; PLAN: r0=101(x), r1=167(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 167
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
