; DESCRIPTION: Renders a green disk with center (41, 218) and radius 32.
; PLAN: r0=41(x), r1=218(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 218
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
