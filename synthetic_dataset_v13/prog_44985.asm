; DESCRIPTION: Renders a green disk with center (337, 58) and radius 41.
; PLAN: r0=337(x), r1=58(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 337
LDI r1, 58
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
