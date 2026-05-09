; DESCRIPTION: Renders a yellow disk with center (253, 131) and radius 21.
; PLAN: r0=253(x), r1=131(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 131
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
