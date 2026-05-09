; DESCRIPTION: Renders a green disk with center (274, 195) and radius 41.
; PLAN: r0=274(x), r1=195(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 195
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
