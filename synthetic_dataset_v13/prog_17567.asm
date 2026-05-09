; DESCRIPTION: Renders a green disk with center (304, 132) and radius 41.
; PLAN: r0=304(x), r1=132(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 132
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
