; DESCRIPTION: Renders a green disk with center (368, 167) and radius 75.
; PLAN: r0=368(x), r1=167(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 167
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
