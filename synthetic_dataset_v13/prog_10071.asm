; DESCRIPTION: Renders a green disk with center (245, 208) and radius 47.
; PLAN: r0=245(x), r1=208(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 208
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
