; DESCRIPTION: Renders a red disk with center (245, 155) and radius 58.
; PLAN: r0=245(x), r1=155(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 155
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
