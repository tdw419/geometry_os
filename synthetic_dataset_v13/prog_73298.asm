; DESCRIPTION: Renders a red disk with center (325, 144) and radius 58.
; PLAN: r0=325(x), r1=144(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 144
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
