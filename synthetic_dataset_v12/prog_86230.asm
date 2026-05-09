; DESCRIPTION: Renders a green disk with center (81, 152) and radius 41.
; PLAN: r0=81(x), r1=152(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 152
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
